//
//  Calculator.swift
//  TabBar Customize SwiftUI
//
//  Created by Antonio Mennillo on 06/05/2020.
//  Copyright © 2020 Antonio Mennillo. All rights reserved.
//

import Foundation
import SwiftUI

struct Calculator:View{
    
    @State var weight : String = ""
    @State var height : String = ""
  
    var result : String {
        let final = (Double(weight) ?? 0) / ((Double(height) ?? 0 ) * (Double(height) ?? 0))
        return "\(String(format: "%.2f",final*10000))"
    }

    var body: some View{
        ZStack{
            Text("UE")
        
        VStack(alignment: .leading){
            HStack(spacing:150.0){
            Text("BMI Calculator")
                .font(.system(size: 21.0))
                .bold()
                Image(systemName: "info.circle")
                    .font(.system(size:20.0))
            
            }
            HStack{
                Text("Weight(Kg):")
                TextField("Weight", text: $weight)
            }
            HStack{
                Text("Height(cm):")
                TextField("Height", text: $height)
            }
            Divider()
            HStack{
                
                Text("BMI:")
                    .bold()
                Text("\(result)")
               
                
            }
        }
         .position(CGPoint(x: 220, y: 110))
         .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
    }
}
    
}

struct InfoBMI : View {
    var body: some View{
        
        Text("")
        
    }
    
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()

    }
}


