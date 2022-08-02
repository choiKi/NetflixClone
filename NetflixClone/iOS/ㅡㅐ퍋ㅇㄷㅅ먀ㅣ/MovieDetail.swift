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
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
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
                        ZStack {
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width / 2.5, height: screen.height / 3)
                                .cornerRadius(10)
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width, height: screen.height / 3)
                                .opacity(0.2)
                        }
        
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
                        
                        ThreeButtonView()
                        
                        CustomTabSwitcher(tabs: [.episodes, .trailers, .more])
                            .padding(.vertical, 10)
                        
                        
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

struct ThreeButtonView: View {
    var body: some View {
        HStack(spacing: 60) {
            SmallVerticalButton(text: "내 목록", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                //
            }
            SmallVerticalButton(text: "좋아요", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                //
            }
            SmallVerticalButton(text: "공유 하기", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                //
            }
            
            Spacer()
        }
        .padding(.leading, 20)
    }
}
