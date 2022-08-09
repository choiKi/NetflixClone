//
//  SearchBar.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/08.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding  var text: String
    @State private var isEditing: Bool = true
    @Binding  var isLoading: Bool
    
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
                    .onTapGesture {
                        isEditing = true
                    }
                    // text가 입력중일때
                if !text.isEmpty {
                    if isLoading {
                        Button {
                            text = ""
                        } label: {
                            ActivityIndicator(style: .medium,
                                              animate: .constant(true))
                            .configure {
                                $0.color = .white
                            }
                        }
                        .padding(. trailing, 16)
                        .frame(width: 35, height: 35)

                    } else {
                        Button {
                            text = ""
                            isEditing = false
                            hideKeyboard()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                
                if isEditing {
                    Button {
                        text = ""
                    } label: {
                        Text("취소")
                            .foregroundColor(.white)
                    }
                    
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
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
       
    }
}
