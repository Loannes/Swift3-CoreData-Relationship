//
//  ManagedParser.swift
//  test_3_relationships
//
//  Created by loannes on 2016. 11. 5..
//  Copyright © 2016년 AI. All rights reserved.
//
//  Description :
//  이 클래스는 CoreData 결과값을 배열 + 해쉬 로 변환해 주는 클래스 이다
//  output -> [ [name: jobs], [name: gate] ]
//
//  ex :
//  let searchResults = try getContext().fetch(fetchRequest)
//  //I like to check the size of the returned results!
//  print(searchResults as NSArray?)
//  return ManagedParser.convertToArray(managedObjects: searchResults as NSArray?)
//

import UIKit
import CoreData

class ManagedParser: NSObject {
    class func convertToArray(managedObjects:NSArray?, parentNode:String? = nil) -> NSArray {
        
        let rtnArr:NSMutableArray = NSMutableArray();
        //--
        if let managedObjs:[NSManagedObject] = managedObjects as? [NSManagedObject] {
            for managedObject:NSManagedObject in managedObjs {
                rtnArr.add(self.convertToDictionary(managedObject: managedObject, parentNode: parentNode));
            }
        }
        
        return rtnArr;
    } //F.E.
    
    class func convertToDictionary(managedObject:NSManagedObject, parentNode:String? = nil) -> NSDictionary {
        
        let rtnDict:NSMutableDictionary = NSMutableDictionary();
        //-
        let entity:NSEntityDescription = managedObject.entity;
        let properties:[String] = (entity.propertiesByName as NSDictionary).allKeys as! [String];
        //--
        let parentNode:String = parentNode ?? managedObject.entity.name!;
        for property:String in properties  {
            if (property.caseInsensitiveCompare(parentNode) != ComparisonResult.orderedSame)
            {
                let value: AnyObject? = managedObject.value(forKey: property) as AnyObject?;
                //--
                if let set:NSSet = value as? NSSet  {
                    rtnDict[property] = self.convertToArray(managedObjects: set.allObjects as NSArray?, parentNode: parentNode);
                } else if let vManagedObject:NSManagedObject = value as? NSManagedObject {
                    
                    if (vManagedObject.entity.name != parentNode) {
                        rtnDict[property] = self.convertToDictionary(managedObject: vManagedObject, parentNode: parentNode);
                    }
                } else  if let vData:AnyObject = value {
                    rtnDict[property] = vData;
                }
            }
        }
        
        return rtnDict;
    }
}
