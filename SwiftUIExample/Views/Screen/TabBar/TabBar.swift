//
//  TabBar.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct TabBar: View {
    
    @State private var defaultView: Int = 0
    var body: some View {
        TabView(selection: $defaultView){
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView(searchBarText: "")
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            PlayView(isShowPhotoLibrary: false)
                .tabItem {
                    Text("Play")
                    Image(systemName: "play")
                }.tag(2)
            
            MessageView()
                .tabItem {
                    Text("Message")
                    Image(systemName: "message")
                }.tag(3)
            
            ProfileView()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person")
                }.tag(4)
            
        }.accentColor(.red)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
