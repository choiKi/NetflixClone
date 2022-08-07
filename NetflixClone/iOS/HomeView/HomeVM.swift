//
//  HomeVM.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import Foundation


class HomeVM: ObservableObject {
    // 영화를 카테고리 별로 정렬하기 위함
    // 코드 가독성을 위해 아래와 같이 메모하면 용이하겠네요
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        
        // movie.keys만 리턴하면 반환 타입이 맞지않는걸 map으로 해결
        movies.keys.map({String($0)})
    }
    
    // cat == category, 카테고리가 있다면 리턴하고 없으면 빈 배열
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({$0.movieType == .movie})
        case .tvShow:
            return (movies[cat] ?? []).filter({$0.movieType == .tvShow})
        case .myList:
            return movies[cat] ?? []
        default:
            return movies[cat] ?? []
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        // category -> "인기영화"인 것들은 GlobalHelpers의 exampleMovies
        movies["인기"] = exampleMovies
        movies["신작"] = exampleMovies.shuffled()
        movies["코미디"] = exampleMovies.shuffled()
        movies["다시 볼만한"] = exampleMovies.shuffled()
        movies["Sci - Fi"] = exampleMovies.shuffled()
    }
}

