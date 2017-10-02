/**
* Author+CoreDataProperties.swift
*
* Motivetica
* Created by: Sasha Prokhorenko on 02.10.17
*
* Copyright (c) 2017 Sasha Prokhorenko
*
*/

import Foundation
import CoreData

extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var quotes: NSSet?

}

// MARK: Generated accessors for quotes
extension Author {

    @objc(addQuotesObject:)
    @NSManaged public func addToQuotes(_ value: Quote)

    @objc(removeQuotesObject:)
    @NSManaged public func removeFromQuotes(_ value: Quote)

    @objc(addQuotes:)
    @NSManaged public func addToQuotes(_ values: NSSet)

    @objc(removeQuotes:)
    @NSManaged public func removeFromQuotes(_ values: NSSet)
}
