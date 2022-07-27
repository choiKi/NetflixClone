//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/27.
//

import SwiftUI


struct MovieDetail: View {
    
    var movie: Movie
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // close View
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                            .cornerRadius(10)
                        
                        MovieInfoSubheadLine(movie: movie)
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}


struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1)
    }
}

struct MovieInfoSubheadLine: View {
    
    var movie: Movie
    var body: some View {
        HStack {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text("개봉일")
            
            Text("평점")
            
            Text("시즌")
        }
        .foregroundColor(.gray)
        .padding(.vertical, 5)
    }
}
