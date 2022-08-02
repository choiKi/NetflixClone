//
//  HomeView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct HomeView: View {
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    
    var body: some View {
        ZStack {
            // 배경을 검정으로
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // Main Vstack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                        
                    TopRowButton()
                        
                        TopMoviePreview(movie: exampleMovie1)
                            .frame(width: screen.width)
                            .padding(.top, -100)
                            .zIndex(-1.0)
                    
                    // id: \.self -> forEach 루프는 각각 루프 사이마다 구별가능한 아이덴티티가 필요함
                    // id를 부여함으로 각 each마다 값을줘서 사용가능
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            // 옆으로 넘기는 ScrollView , Xcode12부턴 content 없애도 무방함
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(vm.getMovie(forCat: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width:100 , height:200)
                                            .padding(.horizontal, 20)
                                            .onTapGesture {
                                                movieDetailToShow = movie
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeInOut)
                    .transition(.slide)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       HomeView()
    }
}

struct TopRowButton: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
            Button(action: {
                
            }, label: {
                Text("티비 쇼")
            })
            Spacer()
            Button(action: {
                
            }, label: {
                Text("영 화")
            })
            Spacer()
            Button(action: {
                
            }, label: {
                Text("내 목록")
            })
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
