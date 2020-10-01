//
//  MuscleObject.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 25/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class MuscleObject: ObservableObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext  //Basic context
    
    @Published var Muscles: [Muscle] = [] //Array with all the records
    
    
    func addCm (cm: Double,type: TypeMuscle) {  //Function to add the Cm
        
        
        if (cm != 0.0) {
            
            /*     Record Creation  */
            let muscle = Muscle(context: context)
            
            muscle.cm = cm
            muscle.type = type.rawValue
            muscle.date = Date()
            
            /* End */
            do {
                
                try context.save()   //Saving into DB
                getAllRecords()
            }
            catch { print(error) }
            
        }
        
    }
    
    
    func getLast(muscle: [Muscle]) -> Muscle  { //Get the last record
        
        return muscle[muscle.count-1]
        
    }
    
    
    func getAllRecords() { //Get all the value
        
        let request = Muscle.getAll()
        
        do {
            Muscles = try context.fetch(request)
        }
        catch { print(error) }
        
        
    }
    
    func getSpecificMuscle(typeMuscle: TypeMuscle) -> [Muscle] { //Get a record with specific muscle
        
        var specifiedMuscle : [Muscle] = [] //New array with single Muscle
        
        
        for muscle in Muscles { //Loop over all the data
            
            if(muscle.type == typeMuscle.rawValue){
                specifiedMuscle.append(muscle)  //Add the specified data with specific muscle
                
            }
            
        }
        
        return specifiedMuscle //return specific array that contains only the specific muscle
        
    }
    
    
    
    func newValue(cm: String,muscle: [Muscle],type: TypeMuscle){ //Function to insert new value in CoreData
        
        
        if (muscle.count > 0){
            
            if (self.getLast(muscle: muscle).date?.yearDayMonth == Date().yearDayMonth ){
                
                self.getLast(muscle: muscle).cm = Double(cm) ?? self.getLast(muscle: muscle).cm
                
                do {
                    try context.save()
                }
                catch {print(error) }
                
            }
            else { self.addCm(cm: Double(cm) ?? 0, type: type) }
            
        }
        else { self.addCm(cm: Double(cm) ?? 0, type: type) }
        
    }
    
    func updateTextField(muscle: [Muscle]) -> String{ //Function that updates the TextField
        
        var value : String = ""
        
        if(muscle.count > 0 ){
            
            if (self.getLast(muscle: muscle).cm != 0) {
                value = String(self.getLast(muscle: muscle).cm)
            }
            else { value = "" }
            
        }
        else{
            value = ""
        }
        
        return value
    }
    
    
}
