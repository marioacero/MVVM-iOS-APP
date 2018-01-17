//
//  MoviesViewModel.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    var repository: MoviesRepsository?
    
    init() {
        repository = MoviesRepsository()
    }
    
    func getMovies( type: ListType, completion: @escaping () -> ()) {
        
        guard let repo = repository else { return }
        
        repo.getMovies(listType: type, page: 0) { (response) in
            switch response {
            case .success(let result):
                break
            case.failure:
                break
            }
        }
    }
}
