//
//  PopularMovieView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/11.
//

import SwiftUI
import Kingfisher
struct PopularMovieView: View {
    
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                Text(movie.name)
                    .font(.headline)
                Spacer()
                Button {
                    // play movie
                } label: {
                    Image(systemName: "arrowtriangle.right.fill")
                }
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture {
                self.movieDetailToShow = movie
            }
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
       
    }
}
