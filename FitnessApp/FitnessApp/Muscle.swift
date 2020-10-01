//
//  Muscle.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 25/05/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import CoreData


public class Muscle: NSManagedObject,Identifiable { //Core data Class Entity
    
    @NSManaged public var date: Date?
    @NSManaged public var type: String?
    @NSManaged public var cm : Double
    
    
}


extension Muscle {
    
    static func getAll() -> NSFetchRequest<Muscle> { //Get all the values in the entity
        
        let request: NSFetchRequest<Muscle> = Muscle.fetchRequest() as! NSFetchRequest<Muscle> //Fetch Request
        
        request.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: true)] //Fetch descriptor
        
        return request
        
    }
    
}




enum TypeMuscle: String,CaseIterable { //Types of muscles
    
    case Arms
    case Quads
    case Calves
    case Chest
    case Shoulder
    case Waist
    
}
