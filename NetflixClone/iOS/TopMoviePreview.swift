//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/25.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    var movie: Movie
    
    // 카테고리 사이에 dot 갯수 조절 -> 마지막 인덱스에는 닷 안붙이려고자함
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count // 4
        // if 0 + 1 != 4
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id:\.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "내 목록", isOnImage: "checkmark", isOffImage: "plus", isOn: false) {
                        // action
                    }
                    Spacer()
                    
                    WhiteButton(text: "재 생", imageName: "play.fill") {
                        //
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "정 보", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        //
                    }
                    Spacer()
                    
                }
               
            }
            .background(
                LinearGradient.blackOpacity
            )
            .padding(.top, 300)
        }
        .foregroundColor(.white)
    }
    
}


struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
