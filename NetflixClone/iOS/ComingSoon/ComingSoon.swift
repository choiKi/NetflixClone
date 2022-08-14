//
//  ComingSoon.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/11.
//

import SwiftUI

struct ComingSoon: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden = true
    // scroll 위치 , vertical방향
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject var vm = ComingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let remove105 = scroll - 105
            // index가 0부터 시작이니까 + 1
            let active = Int(remove105 / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {

        let movies = vm.movies.enumerated().map({ $0 })
        // scroll 위치를 get, set 값으로 받아옴
        let scrolltrackingBinding = Binding {
            return scrollOffset
        } set: { newValue in
            scrollOffset = newValue
            updateActiveIndex(fromScroll: newValue)
        }

        // NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrolltrackingBinding) {
                        LazyVStack {
                         Notification(showNotifactionList: $showNotificationList)
                            // each View
                            // forEach 각각이 index가 부여됨
                            ForEach(Array(movies), id: \.offset) { index, movie in
                                CommingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        // Group으로 묶으면 에니메이션, 크기조정등 하기 용이해짐
                                        Group {
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                        }
                                            .animation(.easeInOut)
                                    )
                            }
                            
                        }
                        .foregroundColor(.white)
                    }
                // scroll 위치 파악
                    /*
                    Text("\(scrollOffset)")
                        .padding()
                        .background(Color.red)
                     */
                        
                }
                NavigationLink(destination: Text("알림 목록"),
                               isActive: $showNotificationList,
                               label: { EmptyView()
                })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                // perform trailing closure
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    self.navBarHidden = true
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    self.navBarHidden = false
                }
            }
        //. }
        
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ComingSoon()
        }
        
    }
}
