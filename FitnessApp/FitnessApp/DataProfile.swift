//
//  DataProfile.swift
//  FitnessApp
//
//  Created by Aiello Giovanni on 08/06/2020.
//  Copyright © 2020 HurricaneBros. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

public class DataProfile : NSManagedObject, Identifiable {  //Core data Class Entity
    
    @NSManaged public var date: Date
    @NSManaged public var weight: Double
    @NSManaged public var height: Double
    @NSManaged public var gender: String?
    @NSManaged public var name: String
    @NSManaged public var surname: String
    
}

extension DataProfile {
    
    static func getAll() -> NSFetchRequest<DataProfile> { //Get all the values in the entity
        
        let request: NSFetchRequest<DataProfile> = DataProfile.fetchRequest() as! NSFetchRequest<DataProfile> //Fetch Request
        
        request.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: true)] //Fetch descriptor
        
        return request
        
    }
    
}

