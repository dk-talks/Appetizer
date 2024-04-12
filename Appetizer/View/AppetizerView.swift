//
//  ContentView.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/02/24.
//

import SwiftUI

struct AppetizerView: View {
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orders")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
        }
        .accentColor(Color("brandColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerView()
    }
}
