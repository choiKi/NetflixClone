//
//  Trailer.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/01.
//

import SwiftUI

struct Trailer: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumanailImageURL: URL
    
}
