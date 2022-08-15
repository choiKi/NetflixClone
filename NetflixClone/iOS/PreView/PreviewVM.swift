//
//  PreviewVM.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/15.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
