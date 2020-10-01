//
//  MotherView.swift
//  FitnessApp
//
//  Created by Antonio Mennillo on 08/06/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import SwiftUI

struct MotherView : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "onboardingView" {
                TutorialView()
            } else if viewRouter.currentPage == "homeView" {
            ContentView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter()) 
    }
}

