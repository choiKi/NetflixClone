//
//  ComingSoonVM.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/14.
//

import Foundation


class ComingSoonVM: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(10)
    }
    
}
