//
//  Morys+CoreDataProperties.swift
//  test_3_relationships
//
//  Created by loannes on 2016. 11. 5..
//  Copyright © 2016년 AI. All rights reserved.
//

import Foundation
import CoreData


extension Morys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Morys> {
        return NSFetchRequest<Morys>(entityName: "Morys");
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var updated_at: NSDate?
    @NSManaged public var created_at: NSDate?

}
