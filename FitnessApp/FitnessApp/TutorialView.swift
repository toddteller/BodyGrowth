//
//  TutorialView.swift
//  FitnessApp
//
//  Created by Antonio Mennillo on 08/06/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    
    @EnvironmentObject var viewRouter : ViewRouter
    @EnvironmentObject var dataProfile: DataProfileObject
    @State private var selectedGenderIndex: Int = 0
    @State var gender :String = ""
    @State var name : String = ""
    @State var surname : String = ""
    @State var age : String = ""
    @State var weigth : String = ""
    @State var height : String = ""
    @State var date: Date = Date()
    @State var Currentpage = 0
    @State var genderOptions = ["Male","Female"]
    
    var body: some View {
        
        VStack{
            ZStack{
                
                if Currentpage == 0 {
                    
                   VStack(alignment: .center){
                                        
                                        Text("Welcome")
                                            .bold()
                                            .font(.largeTitle)
                                            .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                        Text("Keep track of your body progress in a very simple way")
                                            .font(.subheadline)
                                            .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                        Spacer().frame(height:100)
                                        Image("barre")
                                        
                                        Spacer().frame(height:150)
                                    }
                }
                else if Currentpage == 1 {
                     VStack(alignment: .center){
                    
                    Text("Tutorial")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                    Spacer().frame(height:100)
                        
                    Text("bodyGrowth is very simple to use")
                        .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                        .font(.headline)
                    Spacer().frame(height:20)
                    Text("Enter your body measurements in the figure and keep track of your progress in the charts section")
                        .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                        .font(.subheadline)
                        
                         Spacer().frame(height:150)
                                            
                    }
                }
                else {
                    NavigationView {
                        VStack {
                            Text("Complete your profile!").font(.title).foregroundColor(Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))).bold()
                            
                            Form {
                                HStack {
                                    Text("Name")
                                    TextField("Name",text: self.$name)
                                     .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                }
                                HStack {
                                    Text("Surname")
                                    TextField("Surname",text: self.$surname)
                                     .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                }
                                HStack {
                                    Text("Weight")
                                    TextField("Weight",text: self.$weigth)
                                     .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                }
                                HStack {
                                    Text("Height")
                                    TextField("Height",text: self.$height)
                                    .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                    
                                }
                                Picker(selection: self.$selectedGenderIndex,label: Text("Gender")) {
                                    ForEach(0..<self.genderOptions.count) {
                                        Text(self.genderOptions[$0])
                                    }
                                    .pickerStyle(DefaultPickerStyle())
                                }
                                DatePicker("Date of birth",selection: self.$date,in:...Date(),displayedComponents: .date)
                                
                                
                                
                                Button(action: {
                                    self.dataProfile.addDataProfile(date: self.date, name: self.name, surname: self.surname, height: self.height, weight: self.weigth, gender: self.genderOptions[self.selectedGenderIndex])
                                    self.viewRouter.currentPage = "homeView"
                                }) {
                                    Text("Done")
                                     .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                                     .bold()
                                }
                                
                            }
                            
                        }
                        
                    } .edgesIgnoringSafeArea(.all)
                }
                
            }
            pageControl(current: Currentpage)
            Button(action: {
                if self.Currentpage<3 {
                    
                    self.Currentpage += 1
                }
                
                
            }){
                if self.Currentpage < 2
                {
                    Text("Next")
                     .foregroundColor((Color(#colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1))))
                    .bold()
                    
                }
                else{
                    Text("")
                }
            }.padding()
            
        }
        
        
        
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}

struct pageControl : UIViewRepresentable {
    var current = 0
    
    func updateUIView(_ uiView:UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        uiView.currentPage = current
        
    }
    
    
    
    func makeUIView(context: UIViewRepresentableContext<pageControl>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.2516899705, green: 0.5842683911, blue: 0.5455286503, alpha: 1)
        page.numberOfPages = 3
        page.pageIndicatorTintColor = #colorLiteral(red: 0.07481060177, green: 0.170055896, blue: 0.1601929367, alpha: 1)
        return page
    }
}
