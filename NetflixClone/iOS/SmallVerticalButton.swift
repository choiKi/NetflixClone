//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/25.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool
    
    
    var imageName: String {
        if isOn {
            return isOnImage
        } else {
            return isOffImage
        }
    }
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        },label:  {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
    
}


struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SmallVerticalButton(text: "내 목록",
                                isOnImage: "checkmark",
                                isOffImage: "plus",
                                isOn: false ){
                // action trailimg closure
                
            }
        
        }
    }
}
