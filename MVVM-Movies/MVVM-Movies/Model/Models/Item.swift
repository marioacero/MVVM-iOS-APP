//
//  Item.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/16/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation


/// Model for objet Movie or Tv Show containes all info to show in list or details
struct ItemObject: CreateFromArray{
    
    /// Id from db
    let id              : Int
    /// Principal title of the Movie
    let title           : String
    /// Average from votes
    let vote_average    : Float
    /// Synopsis of the movie or Tv Show
    let overview        : String
    /// Release date
    let release_date    : String
    /// Image for poster portrait
    let poster_path     : String
    /// Image for landscape
    let backdrop_path   : String
    /// Genre of the item
    let genres          : [Int]
    /// Name of tv show
    let name            : String
    /// Type of the item (tv or movie)
    let media_type      : String
    /// First air date for the Tv Show
    let first_air_date  : String
    
    
    ///Receive parameters for initializer the struct from api, is called from init JSON
    init(id:Int,title:String,vote_average:Float,overview:String,release_date:String,poster_path:String,backdrop_path:String,genres:[Int],name:String,media_type:String,first_air_date:String){
        self.id            = id
        self.title         = title
        self.vote_average  = vote_average
        self.overview      = overview
        self.release_date  = release_date
        self.poster_path   = poster_path
        self.backdrop_path = backdrop_path
        self.genres        = genres
        self.name          = name
        self.media_type    = media_type
        self.first_air_date = first_air_date
    }
    
    /**
     This init receive and validate data from Json, return nil in case the struct not is available, if all data is true  call super init fof the struct
     - Parameter json : Data from Api Rest
     */
    init?(json: JsonDictionay) {
        guard let id            = json["id"] as? Int else { return nil }
        guard let vote_average  = json["vote_average"] as? Float else { return nil }
        let overview            = json["overview"] as? String ?? ""
        let title               = json["title"] as? String  ?? ""
        let name                = json["name"] as? String  ?? ""
        let release_date        = json["release_date"] as? String ?? ""
        let poster_path         = json["poster_path"] as? String ?? ""
        let backdrop_path       = json["backdrop_path"] as? String ?? ""
        let genres              = json["genre_ids"] as? [Int] ?? []
        let media_type          = json["media_type"] as? String ?? ""
        let first_air_date      = json["first_air_date"] as? String ?? ""
        
        self.init(id:id,title:title,vote_average:vote_average ,overview:overview,release_date:release_date,poster_path:poster_path,backdrop_path:backdrop_path,genres:genres,name:name,media_type:media_type,first_air_date:first_air_date)
    }
}
