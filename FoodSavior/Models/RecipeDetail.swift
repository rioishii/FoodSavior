//
//  RecipeDetails.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/16/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeDetail: NSObject {
	let id: Int
	let recipeName: String
	let imageUrl: String
	let readyInMinutes: Int
	let instructions: [String.SubSequence]
	
	
	init(data: [String : Any]) {
		guard let id = data["id"] as? Int,
			  let recipeName = data["title"] as? String,
			  let readyInMinutes = data["readyInMinutes"] as? Int,
			  let imageUrl = data["image"] as? String,
			  let instructions = data["instructions"] as? String else {

			self.id = -1
			self.recipeName = ""
			self.readyInMinutes = 0
			self.imageUrl = ""
			self.instructions = []
			
			super.init()
			return
		}
		
		self.id = id
		self.recipeName = recipeName
		self.readyInMinutes = readyInMinutes
		self.imageUrl = imageUrl
		
		let splitInstructions = instructions.split(separator: ".")
		self.instructions = splitInstructions
		
		super.init()
	}
}
