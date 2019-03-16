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
    
    var recipe: Recipe? {
        didSet {
            recipeImageView.image = UIImage(named: (recipe?.name)!)
            recipeNameLabel.text = recipe?.name
            recipeCaloriesLabel.text = recipe?.calories
            recipeTimeLabel.text = recipe?.time
            recipeCostLabel.text = recipe?.cost
        }
    }
    
    let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "burger")?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let recipeNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let recipeCaloriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recipeTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recipeCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(recipeCaloriesLabel)
        addSubview(recipeTimeLabel)
        addSubview(recipeCostLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: recipeImageView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(200)]-16-|", views: recipeNameLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(120)]", views: recipeCaloriesLabel)
        
        // vertical constrains
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(20)]-8-[v2(20)]-16-[v3(1)]|", views: recipeImageView, recipeNameLabel, recipeCaloriesLabel, separatorView)
        
        // RecipeTimeLabel
        addConstraintsWithFormat(format: "H:[v0(120)]", views: recipeTimeLabel)
        // top constraints
        addConstraints([NSLayoutConstraint(item: recipeTimeLabel, attribute: .top, relatedBy: .equal, toItem: recipeNameLabel, attribute: .bottom, multiplier: 1, constant: 8)])
        // left constraints
        addConstraints([NSLayoutConstraint(item: recipeTimeLabel, attribute: .left, relatedBy: .equal, toItem: recipeCaloriesLabel, attribute: .right, multiplier: 1, constant: 8)])
        // height constrains
        addConstraints([NSLayoutConstraint(item: recipeTimeLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])

        //RecipeCostLabel
        addConstraintsWithFormat(format: "H:[v0(120)]", views: recipeCostLabel)
        // top constraints
        addConstraints([NSLayoutConstraint(item: recipeCostLabel, attribute: .top, relatedBy: .equal, toItem: recipeNameLabel, attribute: .bottom, multiplier: 1, constant: 8)])
        // left constraints
        addConstraints([NSLayoutConstraint(item: recipeCostLabel, attribute: .left, relatedBy: .equal, toItem: recipeTimeLabel, attribute: .right, multiplier: 1, constant: 8)])
        // height constrains
        addConstraints([NSLayoutConstraint(item: recipeCostLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
        
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
    }
    
}
