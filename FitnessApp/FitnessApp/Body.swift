//
//  Profile.swift
//  FitnessApp
//
//  Created by Antonio Mennillo on 23/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct BodyProfile: View {
    
    @EnvironmentObject var muscle : MuscleObject
    
    @EnvironmentObject var dataProfile : DataProfileObject
    
    var screenSize = UIScreen.main.bounds
    
    @State var shoulder : String = ""
    @State var chest: String = ""
    @State var arm: String = ""
    @State var waist: String = ""
    @State var quads: String = ""
    @State var calves: String = ""
    
    
    var body: some View {
        
        VStack {
            Text("Body")
                .font(.title)
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
            Divider()
            ZStack{
                GeometryReader{ g in   //Geometry Reader allows to move the Text "Profile" closer to status bar
                    
                    Image(self.dataProfile.DataProfiles[0].gender == "Male" ? "man-silhouette": "woman-silhouette" ).resizable().aspectRatio( contentMode: .fit)
                    TextField("cm",text:self.$shoulder,onCommit: {  //Shoulder
                        
                        self.muscle.newValue(cm: self.shoulder, muscle: self.muscle.getSpecificMuscle(typeMuscle: .Shoulder), type: .Shoulder)
                        
                    })
                        .offset(x: self.screenSize.width == 320 ? 35 : 50 , y:self.screenSize.height == 896 ? 135
                            : self.screenSize.height == 736 ? 130: self.screenSize.height == 568 ? 95 : 120)
                        .font(.system(size:15))
                    TextField("cm",text:self.$waist,onCommit: { //waist
                        
                         self.muscle.newValue(cm: self.waist, muscle: self.muscle.getSpecificMuscle(typeMuscle: .Waist), type: .Waist)
                        
                    })
                        .offset(x: self.screenSize.width == 320 ? 25 : 40, y:self.screenSize.height == 896 ? 297 : self.screenSize.height == 736 ? 295 : self.screenSize.height == 568 ? 215 : 270)
                        .font(.system(size:15))
                    TextField("cm",text:self.$calves,onCommit: { //Calves
                        
                             self.muscle.newValue(cm: self.calves, muscle: self.muscle.getSpecificMuscle(typeMuscle: .Calves), type: .Calves)
                        
                    })
                        .offset(x: self.screenSize.width == 320 ? 40 : 50, y:self.screenSize.height == 896 ? 500 : self.screenSize.height == 736 ? 495 : self.screenSize.height == 568 ? 355 : 450)
                        .font(.system(size:15))
                    
                    
                    TextField("cm",text:self.$quads,onCommit: { //Quads
                        
                        self.muscle.newValue(cm: self.quads, muscle: self.muscle.getSpecificMuscle(typeMuscle: .Quads), type: .Quads)
                        
                    })
                        .offset(x:self.screenSize.width == 414 ? 335 : self.screenSize.width == 320 ? 240 : 310, y:self.screenSize.height == 896 ? 390 : self.screenSize.height == 736 ? 390 : self.screenSize.height == 568 ?  280 : 355)
                        .font(.system(size:15))
                    TextField("cm",text:self.$arm,onCommit: { //Arm
                        
                        self.muscle.newValue(cm: self.arm, muscle: self.muscle.getSpecificMuscle(typeMuscle: .Arms), type: .Arms)
                        
                    })
                        .offset(x:self.screenSize.width == 414 ? 353 : self.screenSize.width == 320 ? 250: 315, y:self.screenSize.height == 896 ? 195 : self.screenSize.height == 736 ? 195 : self.screenSize.height == 568 ? 140 : 175)
                        
                        
                        .font(.system(size:15))
                    TextField("cm",text:self.$chest,onCommit: { //Chest
                        
                        self.muscle.newValue(cm: self.chest, muscle: self.muscle.getSpecificMuscle(typeMuscle: .Chest), type: .Chest)
                        
                    })
                        .offset(x:self.screenSize.width == 414 ? 340 : self.screenSize.width == 320 ? 245 : 310, y:self.screenSize.height == 896 ? 140 : self.screenSize.height == 736 ? 135 : self.screenSize.height == 568 ? 98 : 125)
                        .font(.system(size:15))
                }
            }
        }
        .frame(width: screenSize.width, alignment: .center)
            
            
            
            
            
            
            
        .onAppear(){  //This function contains the code that sets the latest value inserted in to TextFields
            self.arm = self.muscle.updateTextField(muscle: self.muscle.getSpecificMuscle(typeMuscle: .Arms))
            self.calves = self.muscle.updateTextField(muscle: self.muscle.getSpecificMuscle(typeMuscle: .Calves))
            self.chest = self.muscle.updateTextField(muscle: self.muscle.getSpecificMuscle(typeMuscle: .Chest))
            self.quads = self.muscle.updateTextField(muscle: self.muscle.getSpecificMuscle(typeMuscle: .Quads))
            self.shoulder = self.muscle.updateTextField(muscle: self.muscle.getSpecificMuscle(typeMuscle: .Shoulder))
            self.waist = self.muscle.updateTextField(muscle: self.muscle.getSpecificMuscle(typeMuscle: .Waist))
           
            print(UIScreen.main.bounds)
           
        }
        
        
    }
    

    
}




struct Body_Previews: PreviewProvider {
    static var previews: some View {
        BodyProfile()
    }
}


struct TextFieldView: View {
    
    var body : some View {
        
        ZStack{
            Text("Ciao")
                .offset(x: 0, y: 130)
        }
        .frame(width:250)
        .border(Color.red)
        
        
    }
    
    
    
}









//414 896


