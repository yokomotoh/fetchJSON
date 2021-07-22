//
//  ContentView.swift
//  fetchJSON
//
//  Created by vincent schmitt on 21/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PostList(year: "2005", title: "Famille Vincent 2005")
                .tabItem { Label("2005", systemImage: "person.fill") }
            
            PostList(year: "2006", title: "Famille Vincent 2006")
                .tabItem { Label("2006", systemImage: "person.fill") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
