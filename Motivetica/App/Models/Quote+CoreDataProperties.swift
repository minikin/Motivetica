//
//  Quote+CoreDataProperties.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//
//

import Foundation
import CoreData

extension Quote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quote> {
        return NSFetchRequest<Quote>(entityName: "Quote")
    }

    @NSManaged public var createdAt: NSDate
    @NSManaged public var id: String
    @NSManaged public var quote: String
    @NSManaged public var author: Author
}
