//
//  Data.swift
//  APIcallfetchJSON
//
//  Created by vincent schmitt on 02/07/2021.
//

import SwiftUI

/*
struct Post: Codable, Identifiable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    */
struct Post: Codable, Identifiable {
    var id: Int
    var ID: String
    var Name: String
    var Category: String
    var Image: String
}

class Api {
    var year: String = "2005"
    var title: String = "famille_vincent"
    let urlHead = "http://www.vinsfinsmotohama.shop/photos/"
    
    init (year: String, title: String) {
        self.year = year
        self.title = title
    }
    
    func getPosts(completion:@escaping ([Post]) -> ()) {
        let json_name = String(title + "_" + year)
        guard let url = URL(string:
                                urlHead + json_name + ".json") else { return }
        //"http://www.vinsfinsmotohama.shop/photos/famille_vincent_2005.json") else { return }
        //guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
            let posts = try JSONDecoder().decode([Post].self, from: data!)
            //print(posts)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            } catch {
                print(error)
            }
        }
        .resume()
    }
}
