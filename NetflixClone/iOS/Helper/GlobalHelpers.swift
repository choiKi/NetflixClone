//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//


// bunch of static information
// 임의로 Movie 변수 하나 만들어서 테스트 용

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360.mp4")!
let exampleImageURL1 = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomImageURL: URL {
    return [exampleImageURL1,exampleImageURL2,exampleImageURL3].randomElement() ?? exampleImageURL1
}
let exampleTrailer1 = Trailer(name: "시즌 3 트레일러", videoURL: exampleVideoURL, thumanailImageURL: exampleImageURL1)
let exampleTrailer2 = Trailer(name: "메인 예고편", videoURL: exampleVideoURL, thumanailImageURL: exampleImageURL2)
let exampleTrailer3 = Trailer(name: "감독 인터뷰", videoURL: exampleVideoURL, thumanailImageURL: exampleImageURL3)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]


let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "Dark",
                          thumbnailURL:URL(string: "https://picsum.photos/200/300/")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers
                          )
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travelers", thumbnailURL:URL(string: "https://picsum.photos/200/301/")!, categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeason: 2, defaultEpisodeInfo: exampleEpisodeInfo1,cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL:URL(string: "https://picsum.photos/200/302/")!, categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeason: 1, defaultEpisodeInfo: exampleEpisodeInfo1,cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL:URL(string: "https://picsum.photos/200/303/")!, categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeason: 4, defaultEpisodeInfo: exampleEpisodeInfo1,cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL:URL(string: "https://picsum.photos/200/304/")!, categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"], year: 2020, rating: "TV-MA", defaultEpisodeInfo: exampleEpisodeInfo1,cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "After Life", thumbnailURL:URL(string: "https://picsum.photos/200/305/")!, categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeason: 2, defaultEpisodeInfo: exampleEpisodeInfo1, cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers)
let exampleMovie7 = Movie(id: UUID().uuidString, name: "Before Life", thumbnailURL:URL(string: "https://picsum.photos/200/304/")!, categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeason: 2, defaultEpisodeInfo: exampleEpisodeInfo1, cast: "최기훈, 박민정",
                          creators: "최기훈",
                          trailers: exampleTrailers)

var exampleMovies: [Movie]  { return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}


let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "더미텍스트 시작", description: "인쇄 및 조판 업계의 더미 텍스트일 뿐입니다. 로렘 입섬은 알려지지 않은 프린터가 활자의 갤러리를 가져다가 스크램블을 한 1500년대부터 업계의 표준 더미 텍스트였다", season: 3, episode: 1)




extension LinearGradient {
    static let blackOpacity = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
        startPoint: .top,
        endPoint: .bottom)
}


extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
