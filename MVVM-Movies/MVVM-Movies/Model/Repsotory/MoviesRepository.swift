//
//  MoviesRepository.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/16/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

enum  ItemDataResponse {
    case success(result: [ItemObject])
    case failure
}

class MoviesRepsository: BaseService {
    
    func getMovies(listType: ListType, page:Int, completion: @escaping (ItemDataResponse) -> Void ) {
        
        let endPoint = setEndPoint(type: listType)
        super.callEndPoint(url: AppConstants.baseUrl + endPoint.rawValue) { (response) in
            print(response)
            
        }
    }
    
    
    func setEndPoint(type: ListType) -> MoviesEndPoint {
        var endPoint: MoviesEndPoint
        switch type {
        case .Popular:
            endPoint = .getPopular
        case .TopRate:
            endPoint = .getTopRates
        case .Upcoming:
            endPoint = .getUpcomings
        }
        return endPoint
    }
    
}
