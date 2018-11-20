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

class RootViewController: UIViewController, SegueHelper {
	
	enum SegueIdentifier: String {
		case embedMoodTable = "embedMoodTable"
		case embedCamera = "embedCamera"
	}
	
	var manageObjectContext: NSManagedObjectContext!
	override func viewDidLoad() {
		print(NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true))
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segueIdentifier(for: segue) {
		case .embedMoodTable:
			guard let nc = segue.destination as? UINavigationController, let vc = nc.viewControllers.first as? MoodsTableViewController else {
				fatalError("unkown vc")
			}
			
		case .embedCamera:
			guard let camera = segue.destination as? CameraViewController else {
				fatalError("unkonw camera vc")
			}
			
		}
	}
	
}
