//
//  ContentView.swift
//  TabBar Customize SwiftUI
//
//  Created by Antonio Mennillo on 06/05/2020.
//  Copyright © 2020 Antonio Mennillo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State var weight = 0.0
    @State var height = 0.0
    
    var body: some View {
      
        TabView(selection: $selection){
           Text("Profile")
            .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName:Constants.TabBarImageName.tabBar2)
                        Text("Profile")
                            .font(.largeTitle)
                    }
            }
            .tag(0)
            
            Text("Charts")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: Constants.TabBarImageName.tabBar1)
                        Text("Charts")
                            .font(.title)
                    }
            }
            .tag(1)
         Calculator()
                .tabItem {
                    VStack {
                        Image(systemName: Constants.TabBarImageName.tabBar0)
                        Text("Calculator")
                            .font(.title)
                    }
            }
            .tag(2)
            
          
                         Text("Settings")
                         .font(.title).tabItem {
                              VStack {
                                  Image(systemName: Constants.TabBarImageName.tabBar3)
                                  Text("Settings")
                                      .font(.title)
                              }
                      }
                      .tag(3)
            
            
        }
        .accentColor(Color(#colorLiteral(red: 0.298600167, green: 0.6644408703, blue: 0.5506110191, alpha: 1)))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}


