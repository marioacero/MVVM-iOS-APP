//
//  ItemsObjectList.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/17/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

/**
 This Model have objets for views and all data about movies and tv shows
 */
struct ItemsObjectList {
    
    ///Number of pages of the section
    let total_pages    : Int
    ///Number of results for the request
    let total_results  : Int
    ///All movies or tv shows in the section and page
    var results        : [ItemObject]
    
    var itemType       : ListType?
    /**
     Receive parameters for initializer the struct from api
     - Parameter total_pages
     - Parameter total_results
     - Parameter results
     */
    init(total_pages:Int,total_results:Int,results:[ItemObject]){
        self.total_pages    = total_pages
        self.total_results  = total_results
        self.results        = results
    }

    /**
     This init receive and validate data from Json, return nil in case the struct not is available, if all data is true  call super init fof the struct
     - Parameter json : Data from Api Rest
     */
    init?(json: JsonDictionay) {
        guard let total_pages     = json["total_pages"] as? Int else { return nil }
        guard let total_results   = json["total_results"] as? Int else { return nil }
        guard let results         = ItemObject.createRequiredInstances(from: json , key: "results") else { return nil }
        self.init(total_pages:total_pages,total_results:total_results,results:results)
    }
}
