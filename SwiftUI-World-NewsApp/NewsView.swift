//
//  NewsView.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import SwiftUI

struct NewsView: View {
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.author ?? "Kotinek")
           
//            Divider()
//            Text()
            
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .padding(.leading, 15.0)
        .background(Color.gray.opacity(0.9), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
                NewsView(article: Article.dummyData)

    }

}
