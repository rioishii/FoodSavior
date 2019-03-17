//
//  RecipeCell.swift
//  FoodSavior
//
//  Created by Rio Ishii on 3/15/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RecipeCell: BaseCell {
    
//    var recipe: Recipe? {
//        didSet {
//
//            guard let recipe = recipe else {
//                return
//            }
//
//            let time = recipe.time ?? 0
//
//
//            recipeImageView.image = UIImage(named: (recipe?.name)!)
//            recipeNameLabel.text = recipe?.name
//            recipeTimeLabel.text = "Ready in \(recipe?.time) minutes"
//        }
//    }
    
    let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let recipeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue", size: 20)
        return label
    }()
    
    let recipeTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    override func setupViews() {
        addSubview(recipeImageView)
        addSubview(recipeNameLabel)
        addSubview(separatorView)
        addSubview(recipeTimeLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: recipeImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: recipeNameLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: recipeTimeLabel)
        
        // vertical constrains
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(25)]-8-[v2(20)]-16-[v3(1)]|", views: recipeImageView, recipeNameLabel, recipeTimeLabel, separatorView)
    
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
    }
    
}
