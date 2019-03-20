//
//  RecipeCell.swift
//  FoodSavior
//
//  Created by Rio Ishii on 3/15/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

protocol RecipeCellDelegate: AnyObject {
	func toggleRecipeSaved(on: Bool, indexPath: Int)
}

class RecipeCell: UITableViewCell {
	
    let favoriteButton = UIButton(type: .system)
	var shouldShowSave = true {
		didSet {
			let image = shouldShowSave ? UIImage(named: "save_icon") : UIImage(named: "x_icon")
			self.favoriteButton.setImage(image, for: .normal)
		}
	}
	
	weak var delegate: RecipeCellDelegate?
	var cellIndexPath: Int?
   
	let recipeImageView: UIImageView = {
		let recipeImageView = UIImageView()
		recipeImageView.contentMode = .scaleAspectFill
		recipeImageView.clipsToBounds = true
		return recipeImageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name:"HelveticaNeue", size: 20)
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	let timeLabel: UILabel = {
		let label = UILabel()
		label.textColor = UIColor.lightGray
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.numberOfLines = 0
		return label
	}()
    
    @objc func favoriteButtonHandler(_ sender:UIButton) {
		// changes heart icon
		guard let delegate = delegate,
		      let indexPath = cellIndexPath else {
			return
		}
		
		delegate.toggleRecipeSaved(on: shouldShowSave, indexPath: indexPath)
    }
	
	// MARK - Initializers
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.formatFavoriteButton()
		self.setupSubviews()
		self.addSubviewConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupSubviews()
		self.addSubviewConstraints()
	}
	
	func setupSubviews() {
		
		self.addSubview(recipeImageView)
		self.addSubview(nameLabel)
		self.addSubview(timeLabel)
        self.addSubview(favoriteButton)
	}
    
    func formatFavoriteButton() {
		self.favoriteButton.tintColor = UIColor.red
        self.favoriteButton.contentHorizontalAlignment = .right
        self.favoriteButton.addTarget(self, action: #selector(self.favoriteButtonHandler), for: .touchUpInside)
    }
	
	func addSubviewConstraints() {
		self.recipeImageView.translatesAutoresizingMaskIntoConstraints = false
		self.recipeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36).isActive = true
		self.recipeImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.recipeImageView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.recipeImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

		self.favoriteButton.translatesAutoresizingMaskIntoConstraints = false
		self.favoriteButton.topAnchor.constraint(equalTo: self.recipeImageView.bottomAnchor, constant: 8).isActive = true
		self.favoriteButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		self.favoriteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
		
		self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
		self.nameLabel.topAnchor.constraint(equalTo: self.recipeImageView.bottomAnchor, constant: 8).isActive = true
		self.nameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.nameLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.favoriteButton.leftAnchor, constant: 8).isActive = true
		
		self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
		self.timeLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8).isActive = true
		self.timeLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        self.timeLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true

	}
}
