//
//  Recipe.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/16/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit
import Foundation

class Recipe: NSObject, NSCoding {
	let id: Int
	let name: String
	let imageUrl: String
	let readyInMinutes: Int
	
    init(data: [String : Any]) {
		guard let id = data["id"] as? Int,
			  let recipeName = data["title"] as? String,
			  let readyInMinutes = data["readyInMinutes"] as? Int,
		      let imagePath = data["image"] as? String else {
				
			self.id = -1
			self.name = ""
			self.readyInMinutes = 0
			self.imageUrl = ""
				
			super.init()
			return
		}
		
		self.id = id
		self.name = recipeName
		self.readyInMinutes = readyInMinutes
		self.imageUrl = "https://spoonacular.com/recipeImages/" + imagePath

		super.init()
	}
	
    // NSCoding Implementation
    
    enum Keys: String {
        case id = "Id"
        case name = "Name"
        case imageUrl = "ImageUrl"
        case readyInMinutes = "ReadyInMinutes"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: Keys.id.rawValue)
        aCoder.encode(name, forKey: Keys.name.rawValue)
        aCoder.encode(imageUrl, forKey: Keys.imageUrl.rawValue)
        aCoder.encode(readyInMinutes, forKey: Keys.readyInMinutes.rawValue)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //add code here
        let id = aDecoder.decodeObject(forKey: Keys.id.rawValue) as! Int
        let name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as! String
        let imageUrl = aDecoder.decodeObject(forKey: Keys.imageUrl.rawValue) as! Int
        let readyInMinutes = aDecoder.decodeObject(forKey: Keys.readyInMinutes.rawValue) as! String
        
        self.init(data: ["id": id, "title": name, "image": imageUrl, "readyInMinutes": readyInMinutes])
    }
}
