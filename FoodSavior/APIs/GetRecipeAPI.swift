//
//  GetRecipeAPI.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/13/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class GetRecipeAPI: NSObject {
	
	static func getRecipes(withIngredients ingredients: [String], completion: @escaping (_ result: [Recipe]?, _ error: Error?) -> Void) {
		let baseQueryString = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?"
		
		// TODO: fix this
		// dairy, egg, gluten, peanut, sesame, seafood, shellfish, soy, sulfite, tree nut, and wheat
		let intolerancesParam = "intolerances=egg"
		let numberOfResultsParam = "&number=20"
		let instructionsParam = "&instructionsRequired=true"
		let ingredientsParam = "&query=" + ingredients.joined(separator: "%2C+")
		
		let queryStringWithParams = baseQueryString + intolerancesParam + numberOfResultsParam + instructionsParam + ingredientsParam

		guard let request = createRequest(withUrlString: queryStringWithParams) else {
			// couldn't properly create the request
			return
		}
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			guard let data = data, let httpResponse = response as? HTTPURLResponse else {
				// handle error
				return
			}
			
			if httpResponse.statusCode == 200 {
				do {
					let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
					
					guard let safeJson = json, let results = safeJson["results"] as? [[String : Any]] else {
						return
					}
					
					// map all the [String : Any] objects to a Recipe Object
					let recipes = results.map({ (recipeData) -> Recipe in
						return Recipe(data: recipeData)
					})
					
					// SUCCESS
					completion(recipes, nil)
				} catch {
					// json seralization failed
					completion(nil, error)
				}
			} else {
				completion(nil, error)
			}
		}

		task.resume()
	}
	
	static func getRecipe(withID id: Int, completion: @escaping (_ result: RecipeDetail?, _ error: Error?) -> Void) {
		let queryString = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/\(id)/information?includeNutrition=true"
	
		guard let request = createRequest(withUrlString: queryString) else {
			// couldn't properly create the request
			return
		}
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			guard let data = data, let httpResponse = response as? HTTPURLResponse else {
				// handle error
				return
			}
			
			if httpResponse.statusCode == 200 {
				do {
					let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
					
					guard let safeJson = json else {
						return
					}
					
					let recipeDetail = RecipeDetail(data: safeJson)
					
					completion(recipeDetail, nil)
				} catch {
					// json seralization failed
					completion(nil, error)
				}
			} else {
				completion(nil, error)
			}
		}
		
		task.resume()
	}
	
	private static func createRequest(withUrlString urlString: String) -> URLRequest? {
		guard let url = URL(string: urlString) else {
			// handle errors
			return nil
		}
		
		var request = URLRequest(url: url)
		request.addValue("f83c2df860mshdf330622647511dp1797dcjsnd6de3705c19e", forHTTPHeaderField: "X-RapidAPI-Key")
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "GET"
		
		return request
	}
}
