//
//  Charts.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 25/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import SwiftUI


struct Charts : View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var muscleName : TypeMuscle
    
    @EnvironmentObject var muscle : MuscleObject
    
    let screenSize = UIScreen.main.bounds //ScreenSize
    
    private let minZoom : CGFloat = 0.6
    
    private let maxZoom : CGFloat = 1.0
    
    @State private var zoom : CGFloat = 1.0
    
    @GestureState var magni : CGFloat = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
        
        
            Text("\(muscleName.rawValue)")  //Single Muscle
             .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
             
            ZStack {
                Image(colorScheme == .light ? "GL" : "GD").renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width)
            ScrollView([.init(rawValue: -100),.horizontal]) {  //Scroll View to scroll through BarCharts
                
                
                HStack(alignment: .bottom){
                
                    
                    ForEach(muscle.getSpecificMuscle(typeMuscle: muscleName).reversed(),id:\.self) { value in //ForEach that creates the single bar chart
                        VStack{
                            if (Double(value.cm) > 0) {
                            Text("\(String(format: "%.1f",value.cm))")  //Value of the bar chart
                            .rotation3DEffect(.init(degrees: 180), axis: (x: 0, y: -1 , z: 0) )
                            .font(.system(size: 15))
                            .animation(nil)
                           
                            Rect(value: CGFloat(value.cm), max: self.getTheMax()) //Bar chart
            
                            Text(self.trigger(magni: self.magni) ? self.getText(index: value, magni: self.magni) : "\(value.date?.monthDay ?? "")") //Date value
                                .font(.system(size: 15))
                                .rotation3DEffect(.init(degrees: 180), axis: (x: 0, y: -1 , z: 0))
                                .animation(nil)
                            }
                        }
                        .animation(.spring())
                    }
                }
            
                
                .scaleEffect(setZoom(magni: magni), anchor: .bottomLeading)  //Scale effect to pinch
                
            }
                
            }
                 
            .gesture(MagnificationGesture().updating($magni, body:  {(value,state,_) in //Pinch gesture
                state = value
                
            }) .onEnded( { (value) in
                
                self.zoom = self.setZoom(magni: value)
               
            }))
                .frame(width:screenSize.width,height: 140)
                .border(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
                .flipsForRightToLeftLayoutDirection(true)
                .environment(\.layoutDirection, .rightToLeft)
   
            
        }
        .frame(width: 1000, height: 180, alignment: .center)
       
        
    }
    
    func setZoom(magni: CGFloat) -> CGFloat {  //Set the max and min zoom of PinchGesture
        
        return max(min(self.zoom*magni, self.maxZoom), self.minZoom)
    }
    
    
    func trigger(magni: CGFloat) -> Bool { //Trigger that show different date values
        
        if (setZoom(magni: magni) <= 0.9 ) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func getText(index: Muscle,magni: CGFloat) -> String { //Function to shows a value between month and year
        
        var value: String? = ""
        
        if (setZoom(magni: magni) <= 0.9) {
            
            value = index.date?.month
            
        }
        
        if (setZoom(magni: magni) <= 0.6) {
            value = index.date?.year
            
        }
        return value!
    }
    
    func getTheMax() -> Double {  //Max value of the bar chart
        
        let max = muscle.getSpecificMuscle(typeMuscle: muscleName).map{$0.cm}.max{a,b in a<b}
      
        return max ?? 0
            

    }
    func getTheMin() -> Double {  //Max value of the bar chart
         
         let max = muscle.getSpecificMuscle(typeMuscle: muscleName).map{$0.cm}.max{a,b in a>b}
       
         return max ?? 0
             

     }
    
    
    
    
}

struct Rect : View {  // Bar Chart
    
    
    var value : CGFloat
    
    var max: Double
    
    var body: some View {
        
       
        let final1 = ((value/(CGFloat(max)-value))/CGFloat(max))*70
        let final2 = (CGFloat(value))/CGFloat(max)*70
        let final3 = CGFloat(max)-value
        let final4 =  (((value/(CGFloat(max)-value))*0.1)/CGFloat(max))*70
       
      
        return VStack{
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)),Color(#colorLiteral(red: 0, green: 0.7939854452, blue: 0.6214950771, alpha: 1))]), startPoint: .bottom, endPoint: .top))
            .padding(.horizontal, 15.0)
            .frame(width: 50, height: value == CGFloat(max) ? final2 : (final3 <= 1 ? final4 : final1))
            .animation(.spring())
          
        }
        
        
        
    }
    
    

    

    
    
}


extension Date {  //Extension to create date Format
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    var year: String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy"
           return dateFormatter.string(from: self)
       }
    
     var monthDay: String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMM d"
           return dateFormatter.string(from: self)
        
       }
    
    var day: String {
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "dddd"
              return dateFormatter.string(from: self)
          }
    
    var yearDayMonth : String {
        let dateFormatter = DateFormatter()
                     dateFormatter.dateFormat = "ddddMMMMyyyy"
                     return dateFormatter.string(from: self)
        
    }
    
    var monthDayYear : DateFormatter {
           let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MMMMddddyyyy"
                        return dateFormatter
           
       }
}




