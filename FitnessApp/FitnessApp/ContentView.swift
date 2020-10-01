//
//  ContentView.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 18/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State var weight = 0.0
    @State var height = 0.0
    @EnvironmentObject var muscle : MuscleObject
    @EnvironmentObject var dataProfile: DataProfileObject
    
    var body: some View {
        
        TabView(selection: $selection){
            
            BodyProfile()
                .tabItem {
                    VStack {
                        Image(systemName:Constants.TabBarImageName.tabBar2)
                        Text("Body")
                            .font(.title)
                    }
            }
            .tag(0)
            
            ChartsView()
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
            
            Settings().tabItem {
                VStack {
                    Image(systemName: Constants.TabBarImageName.tabBar3)
                    Text("Settings")
                        .font(.title)
                    
                }
            }
                
            .tag(3)
            
            
        }
            
            
        .accentColor(Color(#colorLiteral(red: 0.298600167, green: 0.6644408703, blue: 0.5506110191, alpha: 1)))
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            
            self.muscle.getAllRecords()
            self.dataProfile.getAllRecords()
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}



