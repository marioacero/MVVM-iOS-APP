//
//  BaseService.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation
import Alamofire

typealias JsonDictionay = [String : Any]

enum ServiceResponse {
    case success(response: Any)
    case failure
    case notConnectedToInternet
}

enum ResponseStatusCode: Int {
    case success = 200
}

class BaseService {
    
    var dataRequestArray: [DataRequest] = []
    var sessionManager: [String : Alamofire.SessionManager] = [:]
    
    func callEndPoint(url: String, method: Alamofire.HTTPMethod = .get, headers: [String:String]? = [:], params: JsonDictionay? = [:], completion: @escaping (ServiceResponse) -> Void){
        
        let dataRequest: DataRequest?
        
        switch method {
        case .post:
            dataRequest = request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
                
            }
        default:
            dataRequest = request(url, method: method, parameters: params, headers: headers).responseString { (response) in
                
            }
        }
    }
    
    func serializeResponse(response: Alamofire.DataResponse<String>, completion: @escaping (ServiceResponse) -> Void) {
        
    }
}
