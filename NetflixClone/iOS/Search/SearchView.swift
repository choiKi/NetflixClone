//
//  SearchView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/09.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchtextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchtextBinding, isLoading: $vm.isLoading)
                    .padding()
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("일치하는 결과물이 없습니다")
                            .bold()
                            .padding(.top, 100)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        // 검색된 결과
                        VStack {
                            HStack {
                                Text("영화 & 티비프로그램")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
                                Spacer()
                            }
                            SearchResultsGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                    
                }
                Spacer()
            }
            
            if movieDetailToShow != nil{
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchView()
        }
    }
}

struct PopularList: View {
    
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("지금 인기있는")
                    .bold()
                    .font(.title)
                    .padding(.leading, 10)
                Spacer()
            }
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
