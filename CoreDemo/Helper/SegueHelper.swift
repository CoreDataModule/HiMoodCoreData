//
//  SegueHelper.swift
//  CoreDemo
//
//  Created by Li, Havi X. -ND on 2018/11/20.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHelper {
	associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHelper where Self: UIViewController, SegueIdentifier.RawValue == String {
	func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
		guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
			fatalError("unknown segue")
		}
		return segueIdentifier
	}
}
