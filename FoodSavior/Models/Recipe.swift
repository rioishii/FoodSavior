//
//  Recipe.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/16/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class Recipe: NSObject {
	let id: Int
	let name: String
	let imageUrl: String
	let readyInMinutes: Int
    var favorite: Bool
	
	init(data: [String : Any]) {
		guard let id = data["id"] as? Int,
			  let recipeName = data["title"] as? String,
			  let readyInMinutes = data["readyInMinutes"] as? Int,
		      let imagePath = data["image"] as? String else {
				
			self.id = -1
			self.name = ""
			self.readyInMinutes = 0
			self.imageUrl = ""
            self.favorite = false
				
			super.init()
			return
		}
		
		self.id = id
		self.name = recipeName
		self.readyInMinutes = readyInMinutes
		self.imageUrl = "https://spoonacular.com/recipeImages/" + imagePath
        self.favorite = false

		super.init()
	}
	
	
}
