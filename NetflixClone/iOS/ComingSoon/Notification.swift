//
//  Notification.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/11.
//

import SwiftUI

struct Notification: View {
    
    @Binding var showNotifactionList: Bool
    
    var body: some View {
        Button {
            showNotifactionList = true
        } label: {
            HStack {
                Image(systemName: "bell")
                Text("알림")
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Notification(showNotifactionList: .constant(false))
        }
    }
}
