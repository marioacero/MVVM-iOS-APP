//
//  EndPoints.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/16/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation

enum MoviesEndPoint: String {
    case getPopular  = "/movie/popular?"
    case getTopRates = "/movie/top_rated?"
    case getUpcomings  = "/movie/upcoming?"
    case getGenres = "/genre/movie/list?"
}


enum TvShowsEndPoint: String {
    case getPopularTv  = "/tv/popular?"
    case getTopRatesTv = "/tv/top_rated?"
    case getUpcomingsTv = "/tv/airing_today?"
}
