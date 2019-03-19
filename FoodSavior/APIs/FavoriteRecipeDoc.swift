//
//  FavoriteRecipeDoc.swift
//  FoodSavior
//
//  Created by Leandro Solidum on 3/19/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class FavoriteRecipeDoc: NSObject {
    enum Keys: String {
        case dataFile = "Data.plist"
        case imageFile = "image.jpg"
    }
	
	class func saveRecipe(toDisk data: Recipe, image: UIImage) {
		let documentUrl: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
		let documentDirectoryURL = documentUrl.appendingPathComponent("FoodFavorites/\(data.id)")
		
		do {
			try FileManager.default.createDirectory(atPath: documentDirectoryURL.path, withIntermediateDirectories: true, attributes: nil)
		} catch {
			print("Failed to create directory")
		}
		
		do {
			guard let codedData = try? NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true),
				  let imageData = image.jpegData(compressionQuality: 1.0) else {
				return
			}
			try codedData.write(to: documentDirectoryURL.appendingPathComponent("recipe.plist"))
			try imageData.write(to: documentDirectoryURL.appendingPathComponent("image.jpg"))
		} catch {
			print("Failed to write data")
		}
	}
	
	class func readRecipesFromDisk() -> [FavoriteRecipe] {
		let documentUrl: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
		let documentDirectoryURL = documentUrl.appendingPathComponent("FoodFavorites")
		
		guard let recipeFolders = try? FileManager.default.contentsOfDirectory(at: documentDirectoryURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else {
			return []
		}

		let favData = recipeFolders.map { (recipeFolder) -> FavoriteRecipe in
			print(recipeFolder.path + "/image.jpg")
			
			let imageURL = URL(fileURLWithPath: recipeFolder.path + "/image.jpg")
			let dataURL = URL(fileURLWithPath: recipeFolder.path + "/recipe.plist")
			
			guard let imageData = try? Data(contentsOf: imageURL),
				  let data = try? Data(contentsOf: dataURL),
			      let unarchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data),
			      let recipeData = unarchivedData as? Recipe
			else {
				return FavoriteRecipe(recipe: nil, image: nil)
			}
			
			return FavoriteRecipe(recipe: recipeData, image: UIImage(data: imageData))
		}
		
		return favData.filter({ (favRecipe) -> Bool in
			return favRecipe.recipe != nil || favRecipe.image != nil
		})
	}
	
	class func deleteRecipeFromDisk(withId id: Int) {
		let documentUrl: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
		let documentDirectoryURL = documentUrl.appendingPathComponent("FoodFavorites")
		
		let recipeToDelete = documentDirectoryURL.appendingPathComponent("\(id)")
		
		do {
			try FileManager.default.removeItem(atPath: recipeToDelete.path)
		} catch {
			print("Failed to delete favorite")
		}	
	}
}
