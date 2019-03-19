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
    
    private var _data: Recipe?
    var data: Recipe? {
        get {
            // 1
            if _data != nil { return _data }
            
            // 2
            let dataURL = docPath!.appendingPathComponent(Keys.dataFile.rawValue)
            guard let codedData = try? Data(contentsOf: dataURL) else { return nil }
            
            // 3
            _data = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedData) as?
            Recipe
            
            return _data
        }
        
        set {
            _data = newValue
        }
    }
    
    private var _image: UIImage?
    var image: UIImage? {
        get {
            if _image != nil { return _image }
            if docPath == nil { return nil }
            
            let imageURL = docPath!.appendingPathComponent(Keys.imageFile.rawValue)
            guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
            _image = UIImage(data: imageData)
            return _image
        }
        set {
            _image = newValue
        }
    }
    
    init(data: [String:Any], image: UIImage?) {
        super.init()
        _data = Recipe(data: data)
        self.image = image
        saveData()
        saveImages()
    }
    
    
    init(recipe: Recipe, image: UIImage?) {
        super.init()
        _data = Recipe(data: ["id": recipe.id, "title": recipe.name, "image": recipe.imageUrl, "readyInMinutes": recipe.readyInMinutes])
        self.image = image
        saveData()
        saveImages()
    }
    
    var docPath: URL?
    
    init(docPath: URL) {
        super.init()
        self.docPath = docPath
    }
    
    func createDataPath() throws {
        guard docPath == nil else { return }
        
        docPath = FavoriteRecipeDatabase.nextFavoriteRecipeDocPath()
        try FileManager.default.createDirectory(at: docPath!,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
    }
    
    func saveData() {
        // 1
        guard let data = data else { return }
        
        // 2
        do {
            try createDataPath()
        } catch {
            print("Couldn't create save folder. " + error.localizedDescription)
            return
        }
        
        // 3
        let dataURL = docPath!.appendingPathComponent(Keys.dataFile.rawValue)
        
        // 4
        let codedData = try! NSKeyedArchiver.archivedData(withRootObject: data,
                                                          requiringSecureCoding: true)
        
        // 5
        do {
            try codedData.write(to: dataURL)
        } catch {
            print("Couldn't write to save file: " + error.localizedDescription)
        }
    }
    
    func deleteDoc() {
        if let docPath = docPath {
            do {
                try FileManager.default.removeItem(at: docPath)
            }catch {
                print("Error Deleting Folder. " + error.localizedDescription)
            }
        }
    }
    
    func saveImages() {
        // 1
        if _image == nil { return }
        
        // 2
        do {
            try createDataPath()
        } catch {
            print("Couldn't create save Folder. " + error.localizedDescription)
            return
        }
        
        // 3
        let imageURL = docPath!.appendingPathComponent(Keys.imageFile.rawValue)
        
        // 4
        let imageData = _image!.jpegData(compressionQuality: 1.0)

        // 5
        try! imageData!.write(to: imageURL)
    }
    
}
