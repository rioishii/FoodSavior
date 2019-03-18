//
//  File.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
		iv.tintColor = UIColor.rgb(red: 152, green: 251, blue: 152)
		return iv
	}()
	
	override var isHighlighted: Bool {
		didSet {
			imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 152, green: 251, blue: 152)
		}
	}
	
	override var isSelected: Bool {
		didSet {
			imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 152, green: 251, blue: 152)
		}
	}
	
	override func setupViews() {
		super.setupViews()
		
		addSubview(imageView)
		addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
		addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
		
		addConstraints([NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)])
		addConstraints([NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
	}
}
