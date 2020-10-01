//
//  ChartsView.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 25/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import SwiftUI


struct ChartsView : View {

    var body : some View {
        
        ScrollView (showsIndicators: false){  //ScrollView to scroll through the charts
            VStack {
                Text("Charts")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
                Divider()
                ForEach(TypeMuscle.allCases, id: \.self) { type in
                    
                    VStack{
                        Charts(muscleName: type)//All the charts
                            .padding()
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    
    
    
}
