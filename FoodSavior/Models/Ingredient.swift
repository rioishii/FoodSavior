//
//  Ingredient.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class Ingredient: NSObject {
	let name: String
	let amount: String

	init(name: String, amount: String) {
		self.name = name
		self.amount = amount
	}
}
