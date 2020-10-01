//
//  DataProfileObject.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 08/06/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class DataProfileObject : ObservableObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext  //Basic context
    
    @Published var DataProfiles: [DataProfile] = []  //Array with all the records
    
    func addDataProfile (date: Date, name: String, surname: String, height: String, weight: String, gender: String)  {
        
        let dataprofile = DataProfile(context: context)
        
        dataprofile.name = name
        dataprofile.surname = surname
        dataprofile.date = date
        dataprofile.height = Double(height) ?? 0
        dataprofile.weight = Double(weight) ?? 0
        dataprofile.gender = gender
        
        
        do {
            
            try context.save() //saving into the DB
            getAllRecords()
            
        }
        catch {
            print("Error: \(error)")
        }
        
    }
    
    func getAllRecords() { //Get all the value
        
        let request = DataProfile.getAll()
        
        do {
            DataProfiles = try context.fetch(request)
        }
        catch { print(error) }
        
        
    }
    
    func save(){
        
        do {
            try context.save()
        }
        catch{
         print(error)
        }
    }
}
