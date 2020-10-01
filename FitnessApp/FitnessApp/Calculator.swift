//
//  Calculator.swift
//  FitnessApp
//
//  Created by Antonio Mennillo on 23/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct Calculator:View{
    
    @State var weight : String = ""
    @State var height : String = ""
  
    var result : String {
        let final = (Double(weight) ?? 0) / ((Double(height) ?? 0 ) * (Double(height) ?? 0))
        return "\(String(format: "%.2f",final*10000))"
    }

    var body: some View{
        VStack{
            Text("Calculator")
    
            .bold()
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
            Divider()
            
        VStack(alignment: .leading){
            HStack{
            Text("BMI Calculator")
                .font(.system(size: 21.0))
                .bold()
              
            
            }
            HStack{
                           Text("Height(cm):")
                           TextField("Height", text: $height)
                       }
            HStack{
                Text("Weight(Kg):")
                TextField("Weight", text: $weight)
            }
           
          
            HStack(spacing:10){
                Text("BMI:  \(result)")
                    .bold()
                
                VStack{
                if(result<"18.5"){
                    
                    Text("Underweight")
                    .bold()
                }
                if((result>="18.5")&&(result<="24.9")){
                    
                    Text("Normalweight")
                    .bold()
                
                }
                
                if((result>="25.0")&&(result<="29.9")){
                    Text("Overweight")
                    .bold()
                }
                if((result>="30.0")&&(result<="34.9")){
                Text("Obesity Class 1")
                    .bold()
                        
                }
                if((result>="35.0")&&(result<="40.0")){
                Text("Obesity Class 2")
                    .bold()
                }
                if((result>"40")&&(result<="80")){
                Text("Obesity Class 3")
                    .bold()
                 }
                    
                }
            }
            Divider()
        }
            
         .position(CGPoint(x: 215, y: 70))
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
