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
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
        
    }
   
    var body: some View {
        
        let previewDragGesture = DragGesture()
            .onChanged { value in
                if previewHorizontalDragActive {
                    return
                }
                if abs(value.translation.width) > abs(value.translation.height) {
                    if value.translation.height < 30 {
                        previewHorizontalDragActive = true
                        return
                    }
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                let shouldBePosition = value.translation.height + self.previewNewPos
                
                if shouldBePosition < 0 {
                    self.previewCurrentPos = .zero
                    self.previewNewPos = .zero
                } else {
                    let closingPoint = screen.size.height * 0.5
                    if shouldBePosition > closingPoint {
                        withAnimation {
                            self.showPreviewFullscreen = false
                            self.previewCurrentPos = screen.height + 20
                            self.previewNewPos = screen.height + 20
                        }
                    }else {
                        withAnimation {
                            self.previewNewPos = .zero
                            self.previewCurrentPos = .zero
                        }
                    }
                }
                previewHorizontalDragActive = false
            }
        
        
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
                        isVisible: $showPreviewFullscreen,
            externalDragGesture: previewDragGesture)
                            .offset(y: previewCurrentPos)
                            .isHidden(!showPreviewFullscreen)
                            .animation(.easeIn)
                            .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullscreen) { value in
            if value {
                withAnimation {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                }
            } else {
                    withAnimation {
                        self.previewCurrentPos = screen.height + 20
                        self.previewNewPos = screen.height + 20
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
