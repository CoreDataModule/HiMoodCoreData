//
//  MoodyStack.swift
//  CoreDemo
//
//  Created by Li, Havi X. -ND on 2018/11/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import CoreData

func createMoodyContainer(completion: @escaping(NSPersistentContainer) -> ()) {
	//persistentContainer是用来查找对应的数据模型
	let container = NSPersistentContainer.init(name: "Moody")
	container.loadPersistentStores { (_, error) in
		guard error == nil else {
			fatalError("fail to load store:\(String(describing: error))")
		}
		DispatchQueue.main.async {
			completion(container)
		}
 	}
}
