//
//  FoodSelectionViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

protocol FoodSelectionDelegate: AnyObject {
	func cancelFoodSelectionPressed()
	
	func fetchRecipes(ingredients: [String])
}

class FoodSelectionViewController: UIViewController {
	weak var delegate: FoodSelectionDelegate?
	
	var cancelButton: UIButton!
	var titleLabel: UILabel!
	var foodToUseTextField: UITextField!
	var finishButton: UIButton!
	
	var spinner = UIActivityIndicatorView(style: .whiteLarge)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.purple

		setupSubviews()
		addSubviewConstraints()
    }
	
	func setupSubviews() {
		self.cancelButton = UIButton(frame: .zero)
		self.cancelButton.setTitle("Cancel", for: .normal)
		self.cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
		self.cancelButton.sizeToFit()
		
		self.titleLabel = UILabel(frame: .zero)
		self.titleLabel.text = "What ingredients do you want to use?"
		self.titleLabel.textColor = UIColor.white
		self.titleLabel.font = self.titleLabel.font.withSize(30)
		self.titleLabel.lineBreakMode = .byWordWrapping
		self.titleLabel.numberOfLines = 0
		self.titleLabel.textAlignment = .center
		
		self.foodToUseTextField = UITextField(frame: .zero)
		self.foodToUseTextField.delegate = self
		self.foodToUseTextField.setBottomBorder()
		self.foodToUseTextField.backgroundColor = UIColor.purple
		self.foodToUseTextField.font = self.foodToUseTextField.font?.withSize(25)
		self.foodToUseTextField.textColor = UIColor.white
		
		self.finishButton = UIButton(frame: .zero)
		self.finishButton.setTitle("Discover Recipes", for: .normal)
		self.finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
		self.finishButton.backgroundColor = UIColor.red
		self.finishButton.titleLabel?.textColor = UIColor.white
		self.finishButton.addTarget(self, action: #selector(discoverRecipesPressed), for: .touchUpInside)
		self.finishButton.sizeToFit()
		
		self.view.addSubview(cancelButton)
		self.view.addSubview(foodToUseTextField)
		self.view.addSubview(titleLabel)
		self.view.addSubview(finishButton)
	}
	
	func addSubviewConstraints() {
		self.cancelButton.translatesAutoresizingMaskIntoConstraints = false
		self.cancelButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
		self.cancelButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
		self.cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		self.foodToUseTextField.translatesAutoresizingMaskIntoConstraints = false
		self.foodToUseTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		self.foodToUseTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
		self.foodToUseTextField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.foodToUseTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.foodToUseTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
		self.titleLabel.bottomAnchor.constraint(equalTo: self.foodToUseTextField.topAnchor, constant: -16).isActive = true
		self.titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
		
		self.finishButton.translatesAutoresizingMaskIntoConstraints = false
		self.finishButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		self.finishButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
		self.finishButton.topAnchor.constraint(greaterThanOrEqualTo: self.foodToUseTextField.bottomAnchor).isActive = true
		self.finishButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
	
	@objc func cancelPressed() {
		guard let delegate = delegate else {
			return
		}
		delegate.cancelFoodSelectionPressed()
	}
	
	@objc func discoverRecipesPressed() {
		guard let delegate = delegate,
		      let ingredients = self.foodToUseTextField.text else {
			return
		}
		
		self.view.addSubview(spinner)
		
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		spinner.topAnchor.constraint(equalTo: self.foodToUseTextField.bottomAnchor, constant: 20).isActive = true
		
		spinner.startAnimating()
		
		let splitIngredients = ingredients.components(separatedBy: ",")
		
		// delegate.fetchRecipes(ingredients: splitIngredients)
	}
}

extension FoodSelectionViewController: UITextFieldDelegate {
//	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//		// add commas after spaces
//	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
}
