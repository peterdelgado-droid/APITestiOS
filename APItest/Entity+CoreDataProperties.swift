//
//  Entity+CoreDataProperties.swift
//  
//
//  Created by Peter Delgado on 17/6/22.
//
//

import Foundation
import CoreData



extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var reqMethod: String?
    @NSManaged public var url: String?

}
