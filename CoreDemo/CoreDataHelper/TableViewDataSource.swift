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

class TableViewDataSource<Delegate: TableViewDataSourceDelegate>: NSObject, NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource {
	
	typealias Object = Delegate.Object
	typealias Cell = Delegate.Cell
	
	fileprivate let tableView: UITableView
	fileprivate let fetchedResultsController: NSFetchedResultsController<Object>
	fileprivate weak var delegate: Delegate!
	fileprivate let cellIdentifier: String
	
	required init(tableView: UITableView, cellIdentifier: String, fetchedResultsController: NSFetchedResultsController<Object>, delegate: Delegate) {
		self.tableView = tableView
		self.cellIdentifier = cellIdentifier
		self.fetchedResultsController = fetchedResultsController
		self.delegate = delegate
		super.init()
		fetchedResultsController.delegate = self
		try! fetchedResultsController.performFetch()
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	var selectedObject: Object? {
		guard let indexPath = tableView.indexPathForSelectedRow else {
			return nil
		}
		return objectAtIndexPath(indexPath)
	}
	
	func objectAtIndexPath(_ indexPath: IndexPath) -> Object {
		return fetchedResultsController.object(at: indexPath)
	}
	
	func reconfigureFetchRequest(_ configure: (NSFetchRequest<Object>) -> ()) {
		NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: fetchedResultsController.cacheName)
		configure(fetchedResultsController.fetchRequest)
		do {
			try fetchedResultsController.performFetch()
		} catch {
			fatalError("error")
		}
		tableView.reloadData()
	}
	
	//datasource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let section = fetchedResultsController.sections?[section] else {
			return 0
		}
		return section.numberOfObjects
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let object = fetchedResultsController.object(at: indexPath)
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Cell else {
			fatalError("initial cell error")
		}
		delegate.configure(cell, for: object)
		return cell
	}
	
	//NSFetchedResultsControllerDelegate
	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.beginUpdates()
	}
	
	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		switch type {
		case .insert:
			guard let indexPath = newIndexPath else { fatalError("index should not nil") }
			tableView.insertRows(at: [indexPath], with: .fade)
		case .update:
			guard let indexPath = indexPath else { fatalError("index should not nil") }
			let object = objectAtIndexPath(indexPath)
			guard let cell = tableView.cellForRow(at: indexPath) as? Cell else { break }
			delegate.configure(cell, for: object)
		case .move:
			guard let indexPath = indexPath else { fatalError("index should not nil") }
			guard let newIndexPath = newIndexPath else {fatalError("index should not nil") }
			tableView.deleteRows(at: [indexPath], with: .fade)
			tableView.insertRows(at: [newIndexPath], with: .fade)
		case .delete:
			guard let indexPath = indexPath else { fatalError("index should not nil") }
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.endUpdates()
	}
	
}
