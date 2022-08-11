//
//  SearchView.swift
//  NetflixClone
//
//  Created by 최기훈 on 2022/08/09.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    
    var body: some View {
        
        let searchtextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchtextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                if vm.isShowingPopularMovies {
                    
                }
                
                if vm.viewState == .empty {
                    
                } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                    
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchView()
        }
    }
}
