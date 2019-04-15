//
//  Student+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Yiyin Shen on 15/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var course: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Student {
    convenience init(id: String, name: String, course: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.name = name
        self.course = course
    }
}
