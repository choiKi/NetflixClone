//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/27.
//

import SwiftUI
import Kingfisher

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
                        
                        Text(movie.promotionheadLine)
                            .padding(.vertical, 7)
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        PlayButton(text: "재 생", imageName: "play.fill", backgroundColor: Color.red, action: {
                            
                        })
                        .padding(.vertical, 2)
                        .frame(width: screen.width)
                        
                        EpisodeInfoView(movie: movie)
                        
                        CastView(movie: movie)
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
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 5)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct CastView: View {
    var movie: Movie
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("캐스트: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("감독: \(movie.creators)")
                Spacer()
            }
        }
        .padding(.vertical, 2)
        .foregroundColor(.gray)
        .font(.caption)
    }
}

struct EpisodeInfoView: View {
    var movie: Movie
    var body: some View {
        Group {
            Text(movie.episodeInfoDisplay)
                .font(.headline)
                .font(.system(size: 20))
                .padding(.vertical, 5)
            Text(movie.episodeDescribtionDisplay)
        }
    }
}
