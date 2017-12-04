//
//  NSManagedObjectContext.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
  func insert<T: NSManagedObject>() -> T {
    guard let object = NSEntityDescription.insertNewObject(forEntityName: T.entityName, into: self) as? T
      else {
        fatalError("Failed to insert Core Data object \(T.entityName)")
    }
    return object
  }
  
  func saveContext() {
    guard hasChanges else { return }
    do {
      try save()
    } catch let error as NSError {
      fatalError("Failed to save Core Data context: \(error.localizedDescription)")
    }
  }
}
