//
//  FavoriteContainerCell.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/19/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class FavoriteContainerCell: RecipeContainerCell {
	
	override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? RecipeCell else {
			return UITableViewCell()
		}
		
		cell.preservesSuperviewLayoutMargins = false
		cell.separatorInset = UIEdgeInsets.zero
		cell.layoutMargins = UIEdgeInsets.zero
		
		// NOTE: THE FOLLOWING SHOULD ONLY BE UNCOMMENTTED IF REQUESTS ARE BEING MADE
		
		if !recipes.isEmpty {
			let recipe = recipes[indexPath.row]
			
			cell.delegate = self
			cell.cellIndexPath = indexPath.row
			
			cell.recipeImageView.image = recipeImages[recipe]
			cell.nameLabel.text = recipe.name
			cell.timeLabel.text = "Ready in: \(recipe.readyInMinutes) minutes"
			cell.shouldShowSave = false
		}
		
		return cell
	}
	
	
}
