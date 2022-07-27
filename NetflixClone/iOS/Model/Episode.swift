//
//  Episode.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/27.
//

import Foundation

struct Episode: Identifiable {
    
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
    
    var episodes: [Episode]?
}
