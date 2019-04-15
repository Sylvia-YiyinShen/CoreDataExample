//
//  MemberCard+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Yiyin Shen on 15/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//
//

import Foundation
import CoreData


extension MemberCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemberCard> {
        return NSFetchRequest<MemberCard>(entityName: "MemberCard")
    }

    @NSManaged public var cardId: String?

}

extension MemberCard {
    convenience init(cardId: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.cardId = cardId
    }
}
