//
//  MoviePreviewCell.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/15.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    
    var movie: Movie
    
    let colors: [Color] = [.yellow, .gray, .pink, .red, .blue, .green, .orange]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(colors.randomElement())
            )
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset( y: -25)
                .frame(height: 65)
        }
        .frame(height: 100)
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewCell(movie: exampleMovie3)
                .frame(width:200, height: 50)
        }
    }
}
