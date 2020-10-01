//
//  ListTest.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 25/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import SwiftUI



struct ListTest : View {
    
    @EnvironmentObject var muscle : MuscleObject
    
    @EnvironmentObject var data: DataProfileObject
    
    var body : some View {
        
        List{
            VStack{
              
                Text(data.DataProfiles[0].gender ?? "")
                    
                
              
                
                
            }
            
        }
        .onAppear()
            {
                self.muscle.getAllRecords()
        }
        
    }
    
    
    
}
