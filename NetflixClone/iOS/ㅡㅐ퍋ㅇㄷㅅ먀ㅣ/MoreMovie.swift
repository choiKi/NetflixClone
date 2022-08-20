//
//  MoreMovie.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/20.
//

import SwiftUI
import Kingfisher

struct MoreMovie: View {
    
    var movies : [Movie]
    let screen = UIScreen.main.bounds
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ..< movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        KFImage(movie.thumbnailURL)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

struct MoreMovie_Previews: PreviewProvider {
    static var previews: some View {
        MoreMovie(movies: exampleMovies)
    }
}
