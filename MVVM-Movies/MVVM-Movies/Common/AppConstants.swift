//
//  AppConstants.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

struct AppConstants {
    
    static let protocolo    : String = "https://"
    static let apiVersion   : String = "/3"
    static let domain       : String = "api.themoviedb.org"
    static let domainImage  : String = "https://image.tmdb.org/t/p/"
    static let apiKey       : String = "b42de0d7051793f886f6c0569505a420"
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain + AppConstants.apiVersion
     
    struct TabBarItems {
        
        struct  Movies {
            static let name =  "MoviesViewController"
            static let imageEnbled = "MoviesEnabled"
            static let imageDisabled = "MoviesDisabled"
        }
        
        struct TvShows {
            static let name =  "TvShowsViewController"
            static let imageEnbled = "TvShowsEnabled"
            static let imageDisabled = "TvShowsDisabled"
        }
    }
}
