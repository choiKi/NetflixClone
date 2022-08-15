//
//  MoviePreviewRow.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/15.
//


// this file insert to HomeStack

import SwiftUI

struct MoviePreviewRow: View {
    
    var movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("미리보기")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0 ..< movies.count) { index in
                        let movie = movies[index]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 14)
                            .padding(.leading, 10)
                    }
                }
            }
        }
        .frame(height: 185)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies)
        }
        
    }
}
