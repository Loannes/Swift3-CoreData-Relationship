//
//  Todo+CoreDataProperties.swift
//  test_3_relationships
//
//  Created by loannes on 2016. 11. 5..
//  Copyright © 2016년 AI. All rights reserved.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var id: Int32
    @NSManaged public var morys_id: Int32
    @NSManaged public var do_state: Bool

}
