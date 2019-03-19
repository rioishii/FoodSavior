//
//  FavoriteRecipe.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/19/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class FavoriteRecipe: NSObject {
	var recipe: Recipe?
	var image: UIImage?
	
	init(recipe: Recipe?, image: UIImage?)  {
		self.recipe = recipe
		self.image = image
	}
}
