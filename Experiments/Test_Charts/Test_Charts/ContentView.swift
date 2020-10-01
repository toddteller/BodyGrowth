//
//  ContentView.swift
//  Test_Charts
//
//  Created by Aiello Giovanni on 05/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name: [String] = ["1","2","3","4","5","6","2","5","6","1","3"].reversed() //Chart's Values

    let screenSize = UIScreen.main.bounds //ScreenSize
    let color :  [Color] = [.red,.blue,.green]
    @State var tempWidth: Double = 1
    @State var tempPadding : CGFloat  = 0.0
    private let minZoom : CGFloat = 0.5
    private let maxZoom : CGFloat = 1.0
    @State var tempID : UUID = UUID()
    
    @State var temP : Bool = false
    
    @State var textF : String  = "25/02"
    
    
    @State var isPressed : Bool = false
    
    @State private var zoom : CGFloat = 1.0
    @GestureState var magni : CGFloat = 1.0
    
    var body: some View {
        VStack {
            
            
            
            ScrollView([.init(rawValue: -100),.horizontal]) { //Scroll View to scroll through BarCharts
                HStack{
                    ForEach(self.name, id: \.self) { index in
                        VStack {
                            Rect(Universaltoggle: self.$tempID)
                                .scaleEffect(CGSize(width: 2, height: (Double(index) ?? 0)/6), anchor: .bottom) // Scale Effect to resize a bar based on its value
                                
                                
                            
                            
                            Text(self.trigger(magni: self.magni) ? self.getText(index: index, magni: self.magni) : index)
                                .animation(.spring())
                            .rotation3DEffect(.init(degrees: 180), axis: (x: 0, y: -1 , z: 0) )
                            
                        }
                    }
                }
                .scaleEffect(setZoom(magni: magni), anchor: .bottomLeading)
                
                
            }
            .gesture(MagnificationGesture().updating($magni, body:  {(value,state,_) in
                state = value
                
            }) .onEnded( { (value) in
                
                self.zoom = self.setZoom(magni: value)
                print(self.setZoom(magni:self.magni))
                
                
            }))
                .frame(width:screenSize.width,height: 140)
                .border(Color.black)
            .flipsForRightToLeftLayoutDirection(true)
                .environment(\.layoutDirection, .rightToLeft)
               
         
            
            
            
            
        }
        .frame(width: 1000, height: 180, alignment: .center)
        .border(Color.black)
    }
    
    func setZoom(magni: CGFloat) -> CGFloat {
        
        return max(min(self.zoom*magni, self.maxZoom), self.minZoom)
    }
    
    
    func trigger(magni: CGFloat) -> Bool {
        
        if (setZoom(magni: magni) <= 0.8 || setZoom(magni: magni) <= 0.6) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func getText(index: String,magni: CGFloat) -> String {
        
        var value : String = ""
        let month : [String] = ["","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
        
        
        if (setZoom(magni: magni) <= 0.8) {
          
            for i in 1...12 {
                
                if (String(i) == index) {
                    value = month[i]
                }
                
            }
            
        }
        
        if (setZoom(magni: magni) <= 0.6) {
            value = "2020"
            
        }
        return value
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct Rect : View {
    
    @Binding var  Universaltoggle : UUID //Universal Id for single selection of Bar
    @State var toggle = false
    @State var id = UUID()
    var body: some View {
        
        
        Rectangle()
            .fill(self.Universaltoggle == self.id  ?  Color.red  : Color.blue)
            .padding(.horizontal, 15.0)
            .gesture(TapGesture().onEnded({ (value) in
                self.id = UUID()
                self.Universaltoggle = self.id
                print(self.id)
                
                
            }))
        .animation(.spring())
        
        
       
      
    }
    
   
  
    
    
}

