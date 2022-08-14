//
//  DowloadView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/14.
//

import SwiftUI
import Kingfisher

struct DownloadView: View {
    
    @State private var smartDownloadOnOff = "On"
    @State private var showingDownload = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                        Group {
                            Image(systemName: "info.circle.fill")
                            Text("스마트 다운로드")
                        }
                        .foregroundColor(.white)
                            Button {
                                if smartDownloadOnOff == "On" {
                                    smartDownloadOnOff = "Off"
                                }else {
                                    smartDownloadOnOff = "On"
                                }
                            } label: {
                                Text("\(smartDownloadOnOff)")
                                    .bold()
                            }
                            
                    Spacer()
                    }
                Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                            
                        Text("저장된 영상이 없습니다.")
                            .padding(.top, 70)
                            .font(.title)
                            
                        Text("원하는 영상을 다운로드하고, 오프라인에서 아무때나 편하게 영상을 시청하세요")
                            .frame(alignment: .center)
                            .multilineTextAlignment(.center)
                            .padding(20)
                        Button {
                            //
                        } label: {
                            Text("다운로드 가능한 영상 보기")
                                .padding(25)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(5)
                        }

                    }
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            DownloadView()
        }
    }
}
