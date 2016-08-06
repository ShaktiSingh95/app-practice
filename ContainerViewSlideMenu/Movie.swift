//
//  Movies.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Movie{
    
    var title:String?
    var language:String?
    var overview:String?
    var releaseDate:String?
    var averageVote:String?
    var popularity:String?
    var posterImagePath:String?
    init(json:JSON){
        
        self.title = json["original_title"].string
        self.language = json["original_language"].string
        self.overview = json["overview"].string
        self.popularity = json["popularity"].string
        self.averageVote = json["vote_average"].string
        if let path = json["poster_path"].string
        {
            
            self.posterImagePath = Constants.imageUrls.baseImageUrl + path
            
            
        }
        else{
            
            self.posterImagePath = Constants.imageUrls.baseImageUrl
            
        }    }
    
}