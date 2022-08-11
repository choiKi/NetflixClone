//
//  ComingSoon.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/11.
//

import SwiftUI

struct ComingSoon: View {
    
    @Binding var showNotificationList: Bool
    
    @State private var navBarHidden = true
    
    var body: some View {
        // NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    ScrollView {
                        VStack {
                         Notification(showNotifactionList: $showNotificationList)
                            // each View
                        }
                    }
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
            ComingSoon(showNotificationList: .constant(false))
        }
        
    }
}
