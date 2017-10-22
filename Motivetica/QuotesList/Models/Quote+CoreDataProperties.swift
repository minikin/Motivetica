/**
* Quote+CoreDataProperties.swift
*
* Motivetica
* Created by: Sasha Prokhorenko on 02.10.17
*
* Copyright (c) 2017 Sasha Prokhorenko
*/

import Foundation
import CoreData

extension Quote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quote> {
        return NSFetchRequest<Quote>(entityName: "Quote")
    }

    @NSManaged public var id: String?
    @NSManaged public var content: String?
    @NSManaged public var author: Author?
}
