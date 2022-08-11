//
//  ContentView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/24.
//

import SwiftUI


struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }.tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }.tag(1)
            Text("개봉 예정")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("개봉 예정")
                }.tag(2)
            Text("다운로드")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("다운로드")
                }.tag(3)
            Text("더 보기")
                .tabItem {
                    Image(systemName: "equal")
                    Text("더 보기")
                }.tag(4)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
