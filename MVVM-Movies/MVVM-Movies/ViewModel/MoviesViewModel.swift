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
    var popularItems:ItemsObjectList?
    var topRateItems:ItemsObjectList?
    var upcomingItems:ItemsObjectList?
    
    init() {
        repository = MoviesRepsository()
    }
    
    func getMovies( type: ListType, completion: @escaping () -> ()) {
        guard let repo = repository else { return }
        
        repo.getMovies(listType: type, page: 0) { [weak self](response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let result):
                strongSelf.handleSucces(result: result, type: type, completion: completion)
            case.failure:
                break
            }
        }
    }
    
    private func handleSucces(result: ItemsObjectList, type: ListType, completion: @escaping () -> ()) {
        switch type {
        case .Popular:
            self.popularItems = result
            completion()
        case .TopRate:
            self.topRateItems = result
            completion()
        case .Upcoming:
            self.upcomingItems = result
            completion()
        }
    }
    
    func setTableViewCell(cell: CustomCell,  indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            cell.arrayItems  = popularItems?.results
            cell.titleCategory.text = ListType.Popular.rawValue
        case 1:
            cell.arrayItems  = topRateItems?.results
            cell.titleCategory.text = ListType.TopRate.rawValue
        case 2:
            cell.arrayItems  = upcomingItems?.results
            cell.titleCategory.text = ListType.Upcoming.rawValue
        default:
            break
        }
    }
}
