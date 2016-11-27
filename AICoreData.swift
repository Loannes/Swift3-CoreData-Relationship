//
//  AICoreData.swift
//  test_3_relationships
//
//  Created by loannes on 2016. 11. 5..
//  Copyright © 2016년 AI. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AICoreData {
    public class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    public class func fetchedData() -> NSArray {
        let fetchRequest: NSFetchRequest<Morys> = Morys.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            //I like to check the size of the returned results!
            
            print(ManagedParser.convertToArray(managedObjects: searchResults as NSArray?))
            
            return searchResults as NSArray
        } catch {
            print("Error with request: \(error)")
        }
        
        return []
    }
    
    public class func saveData(saveText : String) -> String {
        
        // Save Core Data
        let context = AICoreData.getContext()
        let entityMain =  NSEntityDescription.entity(forEntityName: "Morys", in: context)
        let transc = NSManagedObject(entity: entityMain!, insertInto: context)
        
        //set the entity values
        transc.setValue( AICoreData.fetchedData().count + 1 , forKey: "id")
        transc.setValue( saveText, forKey: "title")
        
        do {
            //save data
            try context.save()
            return "success"
        }catch let error as NSError {
            print ("faild! \(error.localizedFailureReason)")
            return "failed"
        }
    }
    
    public class func updateData(record: AnyObject ,updateData : String) -> String {
        record.setValue(updateData, forKey: "title")
        
        do {
            // Save Record
            try record.managedObjectContext?.save()
            return "success"
        }catch let error as NSError {
            print ("faild! \(error.localizedFailureReason)")
            return "failed"
        }
    }
}
