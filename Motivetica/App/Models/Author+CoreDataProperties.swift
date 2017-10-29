//
//  Author+CoreDataProperties.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//
//

import Foundation
import CoreData

extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var quotes: NSOrderedSet

}

// MARK: Generated accessors for quotes
extension Author {

    @objc(insertObject:inQuotesAtIndex:)
    @NSManaged public func insertIntoQuotes(_ value: Quote, at idx: Int)

    @objc(removeObjectFromQuotesAtIndex:)
    @NSManaged public func removeFromQuotes(at idx: Int)

    @objc(insertQuotes:atIndexes:)
    @NSManaged public func insertIntoQuotes(_ values: [Quote], at indexes: NSIndexSet)

    @objc(removeQuotesAtIndexes:)
    @NSManaged public func removeFromQuotes(at indexes: NSIndexSet)

    @objc(replaceObjectInQuotesAtIndex:withObject:)
    @NSManaged public func replaceQuotes(at idx: Int, with value: Quote)

    @objc(replaceQuotesAtIndexes:withQuotes:)
    @NSManaged public func replaceQuotes(at indexes: NSIndexSet, with values: [Quote])

    @objc(addQuotesObject:)
    @NSManaged public func addToQuotes(_ value: Quote)

    @objc(removeQuotesObject:)
    @NSManaged public func removeFromQuotes(_ value: Quote)

    @objc(addQuotes:)
    @NSManaged public func addToQuotes(_ values: NSOrderedSet)

    @objc(removeQuotes:)
    @NSManaged public func removeFromQuotes(_ values: NSOrderedSet)

}
