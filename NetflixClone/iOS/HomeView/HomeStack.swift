//
//  HomeStack.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/07.
//

import SwiftUI
import Foundation

struct HomeStack: View {
    var vm: HomeVM
    var topRowSelection: HomeTopRow
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        // id: \.self -> forEach 루프는 각각 루프 사이마다 구별가능한 아이덴티티가 필요함
        // id를 부여함으로 각 each마다 값을줘서 사용가능
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                // 옆으로 넘기는 ScrollView , Xcode12부턴 content 없애도 무방함
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(forCat: category, andHomeRow: topRowSelection)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width:120 , height:200)
                                .padding(.horizontal, 10)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(vm: HomeVM(), topRowSelection: .home , movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
        }
       
    }
}
