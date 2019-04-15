//
//  CoreDataManager.swift
//  CoreDataExample
//
//  Created by Yiyin Shen on 15/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {

    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StudentDB")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private class func getContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    class func saveStudent(id: String, name: String, course: String) -> Bool {
        let context = getContext()
        _ = Student(id: id, name: name, course: course, context: context)

        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }

    class func fetchStudent() -> [Student]? {
        let context = getContext()
        let request:NSFetchRequest<Student> = Student.fetchRequest()
        var students: [Student]? = nil
        do {
            students = try context.fetch(request)
            return students
        } catch {
            return students
        }
    }

    //    class func fetchCourse() -> [Course]? {
    //
    //    }
}
