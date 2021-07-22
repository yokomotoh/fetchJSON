//
//  PostList.swift
//  APIcallfetchJSON
//
//  Created by vincent schmitt on 02/07/2021.
//

import SwiftUI
import Combine
import Foundation

struct PostList: View {
    var year: String = "2005"
    var title: String = "Faille Vincent"
    @State var posts: [Post] = []
    //let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
        @State var numberOfRows = 0
    
    var body: some View {
        NavigationView {
            list.navigationTitle(title).navigationBarItems(trailing: addButton)
                }
        /*
        List(posts) { post in
            AsyncImage(
                url: URL(string: post.Image)!, placeholder: {Text("Loading ...")}
            ).aspectRatio(contentMode: .fit)
            Text(post.Name)
         }
         .onAppear {
             Api().getPosts { (posts) in
                 self.posts = posts
             }
         }
         */
     }
     
     
     private var list: some View {
        List(0..<numberOfRows, id: \.self) { item in
        //List(posts) { post in
             AsyncImage(
                 //url: self.url,
                 url: URL(string: posts[item].Image)!,
                placeholder: { Text("Loading ...")
                 },
                image: { Image(uiImage: $0).resizable() }
             )
             //.frame(minHeight: 200, maxHeight: 200)
             //.aspectRatio(2 / 3, contentMode: .fit)
             .scaledToFit()
             //.frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
            VStack(alignment: .leading){
                Text(posts[item].Name)
                Text(posts[item].Category)
            }
        }
        .onAppear {
            Api(year: year).getPosts { (posts) in
                self.posts = posts
            }
        }
    }

    private var addButton: some View {
        Button(action: { self.numberOfRows += 1 }) { Image(systemName: "plus") }
    }
    
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
