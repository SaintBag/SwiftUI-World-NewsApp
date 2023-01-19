//
//  MainView.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    @StateObject private var viewModel: NewsViewModel = NewsViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.6),  Color.yellow.opacity(0.8)]), startPoint: .trailing, endPoint: .topLeading)
                    .ignoresSafeArea()
                Color.yellow
                    .offset(y: 400)
                    .ignoresSafeArea()
                
                ScrollView {
                    Color.yellow
                        .offset(y: 400)
                    
                    LazyVStack(spacing: 24) {
                        ForEach(viewModel.articles) { news in
                            NewsView(article: news)
                        }
                    }
                }
                .padding(.horizontal, 8)
                .navigationBarTitle("News")
                .onAppear(perform: viewModel.fetchNews)
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
