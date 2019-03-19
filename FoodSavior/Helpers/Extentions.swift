//
//  Extentions.swift
//  FoodSavior
//
//  Created by Rio Ishii on 3/15/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UITextField {
	func setBottomBorder() {
		self.layer.shadowColor = UIColor.white.cgColor
		self.layer.shadowOffset = CGSize(width: 0, height: 5)
		self.layer.shadowOpacity = 1.0
		self.layer.shadowRadius = 0.0
	}
}
