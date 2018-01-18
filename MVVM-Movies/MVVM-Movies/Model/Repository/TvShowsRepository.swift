//
//  TvShowsRepository.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/17/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

class TvShowsRepsository: BaseService {
    
    func getTvShows(listType: ListType, page:Int, completion: @escaping (ItemDataResponse) -> Void ) {
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
    
    private func setEndPoint(type: ListType) -> TvShowsEndPoint {
        var endPoint: TvShowsEndPoint
        switch type {
        case .Popular:
            endPoint = .getPopularTv
        case .TopRate:
            endPoint = .getTopRatesTv
        case .Upcoming:
            endPoint = .getUpcomingsTv
        }
        return endPoint
    } 
}
