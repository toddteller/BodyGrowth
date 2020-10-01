//
//  Settings.swift
//  FitnessApp
//
//  Created by Antonio Mennillo on 28/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    var body: some View {
        
        VStack{
            Text("Settings")
                .font(.title)
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
            Divider()
            Spacer().frame(height:10,alignment: .leading)
            Text("Profile")
            .font(.headline)
            .foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)))
              Spacer().frame(height:10)
            SettingsForm()
            
        }
        
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

struct SettingsForm: View {
    
    @EnvironmentObject var dataProfile : DataProfileObject
    
    @State var selectedGenderIndex: Int  = 0
    @State var name : String = ""
    @State var surname: String = ""
    @State var gender: String = ""
    @State var date: Date = Date()
    @State var height : String = ""
    @State var weight : String = ""
    @State var genderOptions = ["Male","Female"]
    var body: some View {
        NavigationView{
            Form{
                
                HStack{
                    
                    Text("Name")
                    TextField("Your Name",text:self.$name,onCommit:{
                        self.dataProfile.DataProfiles[0].name = self.name
                        self.dataProfile.save()
                    })
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Text("Surname")
                    TextField("Your Surname",text:self.$surname,onCommit: {
                        self.dataProfile.DataProfiles[0].surname = self.surname
                        self.dataProfile.save()
                    })
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Image("gender-icon")
                    Picker(selection: self.$selectedGenderIndex,label: Text("Gender")) {
                        ForEach(0..<self.genderOptions.count) {
                            Text(self.genderOptions[$0])
                        }
                        .pickerStyle(DefaultPickerStyle())
                    }
                }
                
                
                HStack{
                    Image("date-icon")
                    DatePicker("Date", selection: self.$date,in:...Date(),displayedComponents: .date)
                }
                
                
                HStack{
                    Image("weight-icon")
                    Text("Weight")
                    TextField("Your Weight",text: self.$weight,onCommit: {
                        self.dataProfile.DataProfiles[0].weight = Double(self.weight) ?? 0
                        self.dataProfile.save()
                    })
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Image("height-icon")
                    Text("Height")
                    TextField("Your Height",text: self.$height,onCommit:{
                        self.dataProfile.DataProfiles[0].height = Double(self.height) ?? 0
                    })
                        .multilineTextAlignment(.trailing)
                }
                
                
            } .background(Color.white)
            .edgesIgnoringSafeArea(.all)
                
        }
            
            
        .onAppear(){
            self.name = self.dataProfile.DataProfiles[0].name
            self.surname = self.dataProfile.DataProfiles[0].surname
            self.selectedGenderIndex = self.dataProfile.DataProfiles[0].gender == "Male" ? 0 : 1
            self.date = self.dataProfile.DataProfiles[0].date
            self.weight = String(self.dataProfile.DataProfiles[0].weight)
            self.height = String(self.dataProfile.DataProfiles[0].height)
        }
        .onDisappear(){
            
            self.dataProfile.DataProfiles[0].date = self.date
            self.dataProfile.DataProfiles[0].gender =  self.selectedGenderIndex == 0 ? "Male" : "Female"
            self.dataProfile.save()
            
        }
    }
}
