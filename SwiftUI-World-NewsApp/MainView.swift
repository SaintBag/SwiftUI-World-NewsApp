//
//  MainView.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: NewsViewModel = NewsViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.articles) { news in
                        NewsView(article: news)
                    }
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 8)
            .navigationBarTitle("News")
            .onAppear(perform: viewModel.fetchNews)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
