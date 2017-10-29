//
//  NSManagedObject.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import CoreData

extension NSManagedObject {
  static var entityName: String {
    return NSStringFromClass(self) as String
  }
}
