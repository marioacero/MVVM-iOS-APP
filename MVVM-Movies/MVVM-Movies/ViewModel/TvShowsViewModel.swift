//
//  TvShowsViewModel.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/17/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

class TvShowViewModel {
    
    var dataItems:[ItemsObjectList] = []
    var repository: TvShowsRepsository?
    weak var delegate: ViewModelDelegate?
    
    init() {
        repository = TvShowsRepsository()
    }
    
    func getTvShows( type: ListType) {
        guard let repo = repository else { return }
        
        repo.getTvShows(listType: type, page: 0) { [weak self](response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(var result):
                result.itemType = type
                strongSelf.dataItems.append(result)
                strongSelf.delegate?.reloadTable(type: strongSelf.dataItems.count - 1)
            case.failure:
                break
            }
        }
    }
}
