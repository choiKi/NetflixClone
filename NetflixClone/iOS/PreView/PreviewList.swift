//
//  PreviewList.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/17.
//

import SwiftUI
import GSPlayer
import AVKit
import VideoPlayer

struct PreviewList: View {
    
    @State private var currentTranslation: CGFloat = 0
    
    var movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    let screen = UIScreen.main.bounds
    
    // 각 인덱스에서 영상이 재생되고 멈추게하는 매서드
    func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false
        }
        if index != currentSelection {
            return false
        }
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PagerView(pageCount: movies.count,
                      currentIndex: $currentSelection,
                      translation: $currentTranslation) {
                ForEach (0..<movies.count) { movieIndex in
                    let movie = movies[movieIndex]
                    PreviewView(vm: PreviewVM(movie: movie), playVideo: shouldPlayVideo(index: movieIndex))
                        .frame(width: screen.width)
                }
            }
                      .frame(width: screen.width)
        }
    }
}

struct ExamplePreviewList: View {
    
    @State private var currentSelection = 0
    @State private var isVisible = true
    
    var body: some View {
        PreviewList(movies: exampleMovies,
                    currentSelection: $currentSelection,
                    isVisible: $isVisible)
    }
}

struct PreviewList_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePreviewList()
    }
}
