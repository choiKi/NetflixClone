//
//  MoreLikeThis.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/01.
//

import SwiftUI
import Kingfisher
struct MoreLikeThis: View {
    
    var movies: [Movie]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<movies.count, id: \.self) { index in
                    StandardHomeMovie(movie: movies[index])
                }
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MoreLikeThis(movies: exampleMovies)
        }
    }
}
