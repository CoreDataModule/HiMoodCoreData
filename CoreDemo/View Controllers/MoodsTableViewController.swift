//
//  MoodsTableViewController.swift
//  CoreDemo
//
//  Created by Li, Havi X. -ND on 2018/11/20.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MoodsTableViewController: UITableViewController ,SegueHelper{
	
	enum SegueIdentifier: String {
		case showMoodDetail = "showMoodDetail"
	}
	
	var manageObjectContext: NSManagedObjectContext!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
	}
	
	//for navigate to next flow
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segueIdentifier(for: segue) {
		case .showMoodDetail:
			print("done")
		}
	}
	
	//private
//	fileprivate var dataSource: TableViewDataSource<MoodsTableViewController>!
	fileprivate var observer: ManagedObjectObserver?
	
	fileprivate func setupTableView()  {
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 100
		let request = Mood.fetchRequest()
		request.fetchBatchSize = 20
		request.returnsObjectsAsFaults = false
		let sort: NSSortDescriptor = NSSortDescriptor(key: "date", ascending: true)
		request.sortDescriptors = [sort]
		let fetchRequestController = NSFetchedResultsController.init(fetchRequest: request, managedObjectContext: manageObjectContext, sectionNameKeyPath: nil, cacheName: nil)
		
	}
}

//extension MoodsTableViewController: TableViewDataSourceDelegate {
//
//	func configure(_ cell: MoodsTableViewController.Cell, for object: MoodsTableViewController.Object) {
//
//	}
//}
