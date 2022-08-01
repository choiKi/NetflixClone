//
//  Movie.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct Movie: Identifiable {
    
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
    
    
    // MovieDetailView
    var year: Int
    var rating: String
    var numberOfSeason: Int?
    
    // Personalization
    
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var cast: String
    var creators: String
    
    
    var episode: [Episode]?
    
    var trailers: [Trailer]
    
    var numberOfSeasonDisplay: String {
        guard let numberOfSeason = numberOfSeason else {
            return "-"
        }
        return "시즌 \(numberOfSeason)"
    }
    
    var promotionheadLine: String {
        guard let numberOfSeason = numberOfSeason else {
            return "바로 시청하기"
        }
        return "시즌 \(numberOfSeason) 시청하기"

    }
    
    var episodeInfoDisplay: String {
        guard let currentEpisode = currentEpisode else {
            return "시즌1 1화"
        }
        return "시즌\(currentEpisode.season) \(currentEpisode.episode)화"
    }
    
    var episodeDescribtionDisplay: String {
        guard let currentEpisode = currentEpisode else {
            return defaultEpisodeInfo.description
        }
        return currentEpisode.description
    }
    
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
    
}

