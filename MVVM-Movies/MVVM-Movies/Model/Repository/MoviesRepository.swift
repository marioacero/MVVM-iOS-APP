//
//  MoviesRepository.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/16/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

enum  ItemDataResponse {
    case success(result: ItemsObjectList)
    case failure
}

class MoviesRepsository: BaseService {
    
    func getMovies(listType: ListType, page:Int, completion: @escaping (ItemDataResponse) -> Void ) {
        let endPoint = setEndPoint(type: listType)
        super.callEndPoint(endPoint:endPoint.rawValue) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let result):
                strongSelf.parseResult(result: result, completion: completion)
                break
            default:
                completion(.failure)
                break
            }
            
        }
    }
    
    private func parseResult(result: JsonDictionay,completion: @escaping (ItemDataResponse) -> Void) {
        
        guard let data = ItemsObjectList(json: result) else {
            completion(.failure)
            return
        }
        
        completion(.success(result: data))
    }
    
    private func setEndPoint(type: ListType) -> MoviesEndPoint {
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
