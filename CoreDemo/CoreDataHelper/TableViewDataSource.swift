//
//  TableViewDataSource.swift
//  CoreDemo
//
//  Created by Li, Havi X. -ND on 2018/11/21.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol TableViewDataSourceDelegate: class {
	associatedtype Object: NSFetchRequestResult
	associatedtype Cell: UITableViewCell
	func configure(_ cell: Cell, for object: Object)
}

class TableViewDataSource<Delegate: TableViewDataSourceDelegate>: NSObject, NSFetchedResultsControllerDelegate {
	
	typealias Object = Delegate.Object
	typealias Cell = Delegate.Cell
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//	}
	

	
	
}
