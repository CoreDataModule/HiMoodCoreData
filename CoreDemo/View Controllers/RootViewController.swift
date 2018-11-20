//
//  RootViewController.swift
//  CoreDemo
//
//  Created by Li, Havi X. -ND on 2018/11/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RootViewController: UIViewController {
	
	var manageObjectContext: NSManagedObjectContext!
	override func viewDidLoad() {
		print(NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true))
	}
	
}
