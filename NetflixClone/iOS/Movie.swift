//
//  Movie.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
}


