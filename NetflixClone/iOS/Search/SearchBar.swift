//
//  SearchBar.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/08.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var text: String = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 320 ,height: 36)
                .cornerRadius(6)
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                    .font(.system(size: 20))
                
                TextField("  Search", text: $text)
                    .background(Color.graySearchBackground)
                    .foregroundColor(.white)
                    
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.graySearchText)
                        .frame(width: 35, height: 35)
                }
    
                Button {
                    text = ""
                } label: {
                    Text("취소")
                        .foregroundColor(.graySearchText)
                }
            }
        }
      
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar()
        }
       
    }
}
