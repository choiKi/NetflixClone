//
//  PreviewView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/15.
//

import SwiftUI
import VideoPlayer
import AVKit
import GSPlayer

struct PreviewView: View {
    
    @ObservedObject var vm: PreviewVM
    
    var playVideo: Bool = true
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView (
                videoURL: vm.movie.trailers.first?.videoURL ,
                playVideo: .constant(playVideo)
            )
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(vm.movie.name)
                            .foregroundColor(vm.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                Spacer()
                
                HStack {
                    ForEach(0 ..< vm.movie.categories.count) { categoryIndex in
                        let category = vm.movie.categories[categoryIndex]
                        HStack {
                            Text(category)
                                .font(.footnote)
                                // 카테고리 마지막에 점 안찍으려고
                            if categoryIndex != vm.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack {
                    Spacer()
                    SmallVerticalButton(
                        text: "내 목록",
                        isOnImage: "checkmark",
                        isOffImage: "plus",
                        isOn: true,
                        color: vm.movie.accentColor) {
                            //
                        }
                    Spacer()
                    Button {
                        
                    } label: {
                        HStack(spacing: 15) {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("재생")
                                .fontWeight(.heavy)
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 15)
                        .border(vm.movie.accentColor, width: 2)
                    }
                    Spacer()
                    SmallVerticalButton(
                        text: "정보",
                        isOnImage: "info.circle",
                        isOffImage: "info.circle",
                        isOn: true,
                        color: vm.movie.accentColor) {
                            //
                        }
                    Spacer()
                }
                .padding(.vertical, 14)
                .padding(.top, 10)
            }
            .padding(.bottom, 25)
            .foregroundColor(vm.movie.accentColor )
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
