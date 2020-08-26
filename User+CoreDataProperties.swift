//
//  User+CoreDataProperties.swift
//  CopyCoredata
//
//  Created by Mauricio Parrales on 8/26/20.
//  Copyright © 2020 test. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?

}
