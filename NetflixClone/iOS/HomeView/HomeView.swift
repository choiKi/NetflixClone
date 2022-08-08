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
    @State private var topRowSelection: HomeTopRow = .home
    @State private var selectedGenre: HomeGenre = .allGenre
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            // 배경을 검정으로
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // Main Vstack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                        
                    TopRowButton(topRowSelection: $topRowSelection, selectedGenre: $selectedGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                        
                        TopMoviePreview(movie: exampleMovie1)
                            .frame(width: screen.width)
                            .padding(.top, -100)
                            .zIndex(-1.0)
                    
                    HomeStack(vm: vm,topRowSelection: topRowSelection ,movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeInOut)
                    .transition(.scale)
            }
            
            if showTopRowSelection  {
                Color.black.opacity(0.85)
                VStack (spacing: 40) {
                    Spacer()
                    ForEach(HomeTopRow.allCases, id: \.self) { row in
                        Button {
                            topRowSelection = row
                            showTopRowSelection = false
                        } label: {
                            if row == topRowSelection {
                                Text("\(row.rawValue)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                            }else {
                                Text("\(row.rawValue)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 25))
                            }
                        }

                    }
                    Spacer()
                    Spacer()
                    Button {
                        showTopRowSelection = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                    Spacer()
                   
                }
                .edgesIgnoringSafeArea(.all)
            }
            
            if showGenreSelection {
                Color.black.opacity(0.85)
                VStack (spacing: 20) {
                    ForEach(HomeGenre.allCases, id: \.self) { row in
                        Spacer()
                        Button {
                            selectedGenre = row
                            showGenreSelection = false
                        } label: {
                            if row == selectedGenre {
                                Text("\(row.rawValue)")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            } else {
                                Text("\(row.rawValue)")
                                    .font(.system(size: 25))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Spacer()
                    Spacer()
                    Button {
                        showGenreSelection = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                Spacer()
                }
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
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var selectedGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .tvShow
                }, label: {
                    Text("티비 쇼")
                })
                Spacer()
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("영 화")
                })
                Spacer()
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("내 목록")
                })
                Spacer()
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        // topRowbutton 에서 넷플릭스 로고말고 다른거를 클릭히였을 때
        case .myList, .tvShow, .movies:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                HStack(spacing: 30) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        Text(topRowSelection.rawValue)
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 10))
                            .rotationEffect(.degrees(180), anchor: .center)
                        
                    })
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        Text(selectedGenre.rawValue)
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 10))
                            .rotationEffect(.degrees(180), anchor: .center)
                        
                    })
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        default :
            Text("error")
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "홈"
    case tvShow = "티비 쇼"
    case movies = "영화"
    case myList = "내 목록"
}

enum HomeGenre: String, CaseIterable {
    case allGenre = "모든 장르"
    case action = "액션"
    case comedy = "코미디"
    case horror = "공포"
    case thriller = "스릴러"
}

