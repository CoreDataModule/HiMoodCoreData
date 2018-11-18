//
//  Mood.swift
//  CoreDemo
//
//  Created by Li, Havi X. -ND on 2018/11/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class Mood: NSManagedObject {
	//NSManaged标签告诉编译器这些属性将由coredata实现
	@NSManaged fileprivate(set) var date: Date
	@NSManaged fileprivate(set) var colors: [UIColor]
	
}
