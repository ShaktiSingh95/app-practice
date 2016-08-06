//
//  Tv.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Tv{
    
    var popularity : String?
    var averageVote : String?
    var firstAirDate : String?
    var originCountry : String?
    var language : String?
    var vote : String?
    var overView : String?
    var posterImagePath : String?
    init(json: JSON){

        self.popularity = json["popularity"].string
        self.averageVote = json["vote_average"].string
        self.firstAirDate = json["first_air_date"].string
        self.language = json["original_language"].string
        self.originCountry = json["origin_country"][0].string
        self.overView = json["overview"].string
        if let path = json["poster_path"].string
        {
            
            self.posterImagePath = Constants.imageUrls.baseImageUrl + path
            
            
        }
        else{
            
            self.posterImagePath = Constants.imageUrls.baseImageUrl
            
        }
        self.vote = json["vote_count"].string

    }
    
}