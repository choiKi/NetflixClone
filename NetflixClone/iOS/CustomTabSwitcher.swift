//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/07/29.
//

import SwiftUI
import Kingfisher

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs , id: \.self) { tab in
                        VStack {
                            // redbar
                            Rectangle()
                                .frame(width: widthForTab(tab) , height: 6)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear)
                                .transition(.slide)
                                .animation(.linear)
                            // btn
                            Button(action: {
                                //state
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                                    
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                    }
                }
            }
            switch currentTab {
            case .episodes:
                Text("에피소드")
            case .trailers:
                Text("트레일러")
            case .more:
                Text("더 보기")
            default:
                Text("에러")
            }
        
            
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episodes = "에피소드 보기"
    case trailers = "트레일러와 상세정보 보기"
    case more = "비슷한 영화 찾기"
}


struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more])
        }
        
    }
}

