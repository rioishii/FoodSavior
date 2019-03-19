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
	let servings: Int
	let instructions: [Instruction?]
	let ingredients: [Ingredient?]
	
	init(data: [String : Any]) {
		guard let id = data["id"] as? Int,
			  let recipeName = data["title"] as? String,
			  let readyInMinutes = data["readyInMinutes"] as? Int,
			  let imageUrl = data["image"] as? String,
			  let analyzedInstructions = data["analyzedInstructions"] as? [[String : Any]],
			  let servings = data["servings"] as? Int,
			  let instructions = analyzedInstructions[0]["steps"] as? [[String : Any]],
			  let nutrition = data["nutrition"] as? [String : Any],
			  let ingredients = data["extendedIngredients"] as? [[String : Any]] else {

			self.id = -1
			self.recipeName = ""
			self.readyInMinutes = 0
			self.imageUrl = ""
			self.servings = 0
			self.instructions = []
			self.ingredients = []
			
			super.init()
			return
		}
		
		self.id = id
		self.recipeName = recipeName
		self.readyInMinutes = readyInMinutes
		self.imageUrl = imageUrl
		self.servings = servings
		
		self.instructions = instructions.map({ (instruction) -> Instruction? in
			if let number = instruction["number"] as? Int,
				let text = instruction["step"] as? String {
				return Instruction(number: number, text: text)
			}
			return nil
		})
		
		self.ingredients = ingredients.map({ (ingredient) -> Ingredient? in
			if let nameAndAmount = ingredient["original"] as? String {
				return Ingredient(name: nameAndAmount)
			}
			return nil
		})
		
		
		super.init()
	}
}
