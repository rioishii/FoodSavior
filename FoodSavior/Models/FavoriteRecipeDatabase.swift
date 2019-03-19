//
//  FavoriteRecipeDatabase.swift
//  FoodSavior
//
//  Created by Leandro Solidum on 3/19/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import Foundation

class FavoriteRecipeDatabase: NSObject {
    static let privateDocsDir: URL = {
        // 1
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // 2
        let documentsDirectoryURL = paths.first!.appendingPathComponent("PrivateDocuments")
        
        // 3
        do {
            try FileManager.default.createDirectory(at: documentsDirectoryURL,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
        } catch {
            print("Couldn't create directory")
        }
        
        print(documentsDirectoryURL.absoluteString)
        
        return documentsDirectoryURL
    }()
    
    
    class func nextFavoriteRecipeDocPath() -> URL? {
        // 1
        guard let files = try? FileManager.default.contentsOfDirectory(
            at: privateDocsDir,
            includingPropertiesForKeys: nil,
            options: .skipsHiddenFiles) else { return nil }
        
        var maxNumber = 0
        
        // 2
        files.forEach {
            if $0.pathExtension == "favoriterecipe" {
                let fileName = $0.deletingPathExtension().lastPathComponent
                maxNumber = max(maxNumber, Int(fileName) ?? 0)
            }
        }
        
        // 3
        return privateDocsDir.appendingPathComponent(
            "\(maxNumber + 1).favoriterecipe",
            isDirectory: true)
    }
    
    class func loadFavoriteRecipeDocs() -> [FavoriteRecipeDoc] {
        // 1
        guard let files = try? FileManager.default.contentsOfDirectory(
            at: privateDocsDir,
            includingPropertiesForKeys: nil,
            options: .skipsHiddenFiles) else { return [] }
        
        return files
            .filter { $0.pathExtension == "favoriterecipe" } // 2
            .map { FavoriteRecipeDoc(docPath: $0) } // 3
    }
    
}
