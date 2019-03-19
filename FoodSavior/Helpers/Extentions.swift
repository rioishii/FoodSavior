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
	func underlined(){
		let border = CALayer()
		let width = CGFloat(1.0)
		border.borderColor = UIColor.blue.cgColor
		border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
		border.borderWidth = width
		self.layer.addSublayer(border)
		self.layer.masksToBounds = true
	}
}
