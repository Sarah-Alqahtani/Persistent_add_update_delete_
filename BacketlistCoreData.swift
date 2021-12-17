//
//  BacketlistCoreData.swift
//  Backet list
//
//  Created by admin on 16/12/2021.


import Foundation
import CoreData



 extension Entity{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

   @NSManaged public var textcore: String?
   @NSManaged public var idcore: String?

}


extension Entity : Identifiable {

}

