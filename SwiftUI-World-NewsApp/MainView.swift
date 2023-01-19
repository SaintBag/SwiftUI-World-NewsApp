//
//  ContentView.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import SwiftUI

struct MainView: View {
    
    @State var viewModel = NewsViewModel(apiService: APIService())
    
    var body: some View {
        NavigationView {
            ZStack {
                Text(viewModel.errorMessage)
                List {
                    ForEach(viewModel.articles) { article in
                        NewsView(article: article.articles)
                            .listRowSeparator(.hidden)
                    }
                }
                .navigationTitle("NEWS")
                .task {
                   await viewModel.fetchArticle()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
