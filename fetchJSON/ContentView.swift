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
            PostList(year: "2005", title: "famille_vincent")
                .tabItem { Label("2005", systemImage: "person.fill") }
            
            PostList(year: "2006", title: "famille_vincent")
                .tabItem { Label("2006", systemImage: "person.fill") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
