//
//  MoviesViewModel.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    var dataItems:[ItemsObjectList] = []
    var repository: MoviesRepsository?
    
    init() {
        repository = MoviesRepsository()
    }
    
    func getMovies( type: ListType, completion: @escaping () -> ()) {
        guard let repo = repository else { return }
        
        repo.getMovies(listType: type, page: 0) { [weak self](response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(var result):
                result.itemType = type
                strongSelf.dataItems.append(result)
            case.failure:
                break
            }
            completion()
        }
    }
}
