//
//  Instruction.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class Instruction: NSObject {
	let number: Int
	let stepText: String
	
	init(number: Int, text: String) {
		self.number = number
		self.stepText = text
	}
}
