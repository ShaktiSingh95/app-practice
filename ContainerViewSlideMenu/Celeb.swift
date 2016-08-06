//
//  Celebs.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Celeb{
    
    var knownFor = [Movie]()
    var name : String?
    var popularity : String?
    var profileImagePath: String?
    init(json: JSON){
        
        self.name = json["name"].string
        self.popularity = json["popularity"].string
        if let path = json["profile_path"].string
        {
        
            self.profileImagePath = Constants.imageUrls.baseImageUrl + path

        
        }
        else{
            
            self.profileImagePath = Constants.imageUrls.baseImageUrl
            
        }
        
        for (_,subJson) in json["known_for"]{
        self.knownFor.append(Movie(json: subJson))
        }
    }
    
}