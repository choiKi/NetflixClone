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
//  트레일러
let exampleTrailer1 = Trailer(name: "시즌 3 트레일러", videoURL: exampleVideoURL, thumanailImageURL: exampleImageURL1)
let exampleTrailer2 = Trailer(name: "메인 예고편", videoURL: exampleVideoURL, thumanailImageURL: exampleImageURL2)
let exampleTrailer3 = Trailer(name: "감독 인터뷰", videoURL: exampleVideoURL, thumanailImageURL: exampleImageURL3)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

// 에피소드
let episode1 = Episode(name: "끝과 시작", season: 1, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/12", description: "6달 뒤 사망 판정받은 시한부 소년, 세상을 둘러보는 가치가 변하게 되고 자신이 진정으로 원하는것을 하기 시작하는데..", length: 52, videoURL: exampleVideoURL)
let episode2 = Episode(name: "사고뭉치", season: 1, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/13", description: "처음 시작한 일, 역시나 쉽지는 않고 절망이 몰려올때 다가오는 누군가. 조력자??", length: 48, videoURL: exampleVideoURL)
let episode3 = Episode(name: "평화", season: 1, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/14", description: "제이미를 만난 후 모든게 평화롭게 순탄하다. 그 평화가 불안하기만 한 조디 점점 남은 시간은 조여오는데", length: 51, videoURL: exampleVideoURL)
let episode4 = Episode(name: "귀신", season: 2, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/15", description: "조디의 일의 관심을 가지는 귀신이라는 남자 어딘가 불안하다. 하지만 거절할수없는 조디", length: 52, videoURL: exampleVideoURL)
let episode5 = Episode(name: "뜻밖의 손님", season: 2, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/16", description: "귀신을 만나고 승승장구 하는 조디, 그 덕에 자신을 떠났던 사랑했던 이들이 돌아오고 남은 기간 3개월 조디의 끝은?", length: 48, videoURL: exampleVideoURL)
let episode6 = Episode(name: "D-150", season: 2, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/17", description: "계속 조여오는 숫자에 미칠것같은 조디, 약을 투여해보지만 나아질 기세는 없고, 이 사실을 모르는 주변사람들 조디를 다그치기 시작하고 엇갈리기 시작하는데", length: 51, videoURL: exampleVideoURL)
 var allExampleEpisodes = [episode1,episode2,episode3,episode4,episode5,episode6]

// 홈 뷰 영화 예시

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

// 디테일뷰 더미 텍스트

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
