//
//  ContentView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let screen = UIScreen.main.bounds
    
    @State private var showPreviewFullscreen = false
    @State private var previewStartingIndex: Int = 0
    @State private var previewCurrentPos: CGFloat = 1400
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
        
    }
   
    var body: some View {
        ZStack {
            TabView {
                HomeView(showPreviewFullScreen: $showPreviewFullscreen, previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Label("홈", systemImage: "house")
                    }.tag(0)
                
                SearchView()
                    .tabItem {
                        Label("검색", systemImage: "magnifyingglass")
                    }.tag(1)
                
                DownloadView()
                    .tabItem {
                        Label("다운로드", systemImage: "square.and.arrow.down.fill")
                    }.tag(2)
                
                ComingSoonView()
                    .tabItem {
                        Label("개봉예정", systemImage: "play.fill")
                    }
                 
            }
            .accentColor(.white)
            
            PreviewList(movies: exampleMovies,
                        currentSelection: $previewStartingIndex,
                        isVisible: $showPreviewFullscreen)
                            .offset(y: previewCurrentPos)
                            .isHidden(!showPreviewFullscreen)
                            .animation(.easeIn)
                            .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullscreen) { value in
            if value {
                withAnimation {
                    previewCurrentPos = .zero
                }
            } else {
                    withAnimation {
                        self.previewCurrentPos = screen.height + 20
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
