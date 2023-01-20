//
//  NewsView.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//


import SwiftUI
import URLImage

struct NewsView: View {
    
    let article: Article
    
    var body: some View {
        
        VStack {
            if let imageUrl = article.image,
               let url = URL(string: imageUrl) {
                URLImage(url, identifier: article.id.uuidString, failure: { error, _ in
                    
                }, content: { articlePhoto in
                    articlePhoto
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 250, maxHeight: 300)
            } else {
                ImageView()
            }
            
            TitleView(title: article.title)
            DescriptionView(description: article.description, source: article.source, author: article.author)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(article: Article.fakeNews)
        
    }
}

struct ImageView: View {
    
    var body: some View {
        
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 300, maxWidth: .infinity, minHeight: 220, maxHeight: 280)
        Text("NO PHOTO")
    }
}

struct TitleView: View {
    
    let title: String?
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(title ?? "")
                .font(.title)
                .padding(.init(top: 20, leading: 4, bottom: 20, trailing: 4))
            
        }
        .padding(.horizontal, 4)
    }
}

struct DescriptionView: View {
    
    let description: String?
    let source: String?
    let author: String?
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 4) {
            
            VStack(alignment: .trailing) {
                
                Text(description ?? "")
                    .font(.callout)
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                VStack(alignment: .leading) {
                    Text("Source: \(source ?? "N/A")")
                    Text("Author: \(author ?? "N/A")")
                }
                .font(.footnote)
                .padding()
            }
        }
        .padding(.horizontal, 6)
    }
}
