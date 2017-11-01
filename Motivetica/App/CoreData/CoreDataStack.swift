//
//  CoreDataStack.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {

  // MARK: - Properties
  private let modelName: String
  
  private lazy var storeContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: self.modelName)
    //self.seedCoreDataContainerIfFirstLaunch()
    container.loadPersistentStores { (_, error) in
      if let error = error as NSError? {
        print("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()
  
  private static var managedObjectContext: NSManagedObjectContext!
  static var moc: NSManagedObjectContext! {
    if managedObjectContext == nil {
      fatalError("Core Data Stack has not been initialized")
    }
    return managedObjectContext
  }
  
  // MARK: - Initializers
  init(modelName: String) {
    self.modelName = modelName
    CoreDataStack.managedObjectContext = storeContainer.viewContext
  }
}

  // MARK: - CoreDataSeed
private extension CoreDataStack {
  func seedCoreDataContainerIfFirstLaunch() {
    let previouslyLaunched = UserDefaults.standard.bool(forKey: UserKeys.firstAppLaunch)
    if !previouslyLaunched {
      UserDefaults.standard.set(true, forKey: UserKeys.firstAppLaunch)
      // Default directory where the CoreDataStack will store its files
      let directory = NSPersistentContainer.defaultDirectoryURL()
      let url = directory.appendingPathComponent(modelName + ".sqlite")
      
      // Copying the SQLite file
      let seededDatabaseURL = Bundle.main.url(forResource: modelName, withExtension: "sqlite")!
      _ = try? FileManager.default.removeItem(at: url)
      do {
        try FileManager.default.copyItem(at: seededDatabaseURL, to: url)
      } catch let nserror as NSError {
        fatalError("Error: \(nserror.localizedDescription)")
      }
      
      // Copying the SHM file
      let seededSHMURL = Bundle.main.url(forResource: modelName, withExtension: "sqlite-shm")!
      let shmURL = directory.appendingPathComponent(modelName + ".sqlite-shm")
      _ = try? FileManager.default.removeItem(at: shmURL)
      do {
        try FileManager.default.copyItem(at: seededSHMURL, to: shmURL)
      } catch let nserror as NSError {
        fatalError("Error: \(nserror.localizedDescription)")
      }
      
      // Copying the WAL file
      let seededWALURL = Bundle.main.url(forResource: modelName, withExtension: "sqlite-wal")!
      let walURL = directory.appendingPathComponent(modelName + ".sqlite-wal")
      _ = try? FileManager.default.removeItem(at: walURL)
      do {
        try FileManager.default.copyItem(at: seededWALURL, to: walURL)
      } catch let nserror as NSError {
        fatalError("Error: \(nserror.localizedDescription)")
      }
      print("Seeded Core Data")
    }
  }
}
