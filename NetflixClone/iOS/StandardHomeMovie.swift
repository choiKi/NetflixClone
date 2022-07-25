//
//  StandardHomeMovie.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import SwiftUI
// 패키지 import
import Kingfisher

struct StandardHomeMovie: View {
    
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
            
    }
}


struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
            
    }
}
