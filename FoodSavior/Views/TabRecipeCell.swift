//
//  FeedCell.swift
//  FoodSavior
//
//  Created by Rio Ishii on 3/16/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class TabRecipeCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    
    let cellId = "cellId"
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
		
		collectionView.register(RecipeItemCell.self, forCellWithReuseIdentifier: cellId)
		
        addSubview(collectionView)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
		self.collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
		self.collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
		self.collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
		
		// addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        // addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? RecipeItemCell else {
            return UICollectionViewCell()
        }
        
        cell.recipeImageView.image = UIImage(named: "Some Chicken")
        cell.recipeNameLabel.text = "Some Chicken Dish"
        cell.recipeTimeLabel.text = "Ready in 30 Minutes"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
