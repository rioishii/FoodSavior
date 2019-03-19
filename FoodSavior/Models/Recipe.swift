//
//  Recipe.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/16/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit
import Foundation

class Recipe: NSObject, NSCoding, NSSecureCoding {
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
        aCoder.encode(NSNumber(value: id), forKey: Keys.id.rawValue)
        aCoder.encode(name as NSString, forKey: Keys.name.rawValue)
        aCoder.encode(imageUrl as NSString, forKey: Keys.imageUrl.rawValue)
        aCoder.encode(NSNumber(value: readyInMinutes), forKey: Keys.readyInMinutes.rawValue)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //add code here
        let id = aDecoder.decodeObject(of: NSNumber.self, forKey: Keys.id.rawValue)
        let name = aDecoder.decodeObject(of: NSString.self, forKey: Keys.name.rawValue) as String? ?? ""
        let imageUrl = aDecoder.decodeObject(of: NSString.self, forKey: Keys.imageUrl.rawValue) as String? ?? ""
        let readyInMinutes = aDecoder.decodeObject(of: NSNumber.self, forKey: Keys.readyInMinutes.rawValue)
        
        self.init(data: ["id": id?.intValue ?? 0, "title": name, "image": imageUrl, "readyInMinutes": readyInMinutes?.intValue ?? 0])
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
}
