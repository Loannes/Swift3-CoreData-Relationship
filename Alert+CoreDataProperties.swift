//
//  Alert+CoreDataProperties.swift
//  test_3_relationships
//
//  Created by loannes on 2016. 11. 5..
//  Copyright © 2016년 AI. All rights reserved.
//

import Foundation
import CoreData


extension Alert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alert> {
        return NSFetchRequest<Alert>(entityName: "Alert");
    }

    @NSManaged public var id: Int32
    @NSManaged public var todo_id: Int32
    @NSManaged public var alert_at: NSDate?
    @NSManaged public var type: String?

}
