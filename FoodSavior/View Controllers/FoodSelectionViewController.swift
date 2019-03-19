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
	func fetchRecipes(ingredients: [String], allergies: [String])
}

class FoodSelectionViewController: UIViewController {
	let allergens = "dairy, egg, gluten, peanut, sesame, seafood, shellfish, soy, sulfite, tree nut, and wheat"
	
	weak var delegate: FoodSelectionDelegate?
	
	var cancelButton: UIButton!
	
	var titleLabel: UILabel!
	var foodToUseTextField: UITextField!
	var allergyLabel: UILabel!
	var allergyTextField: UITextField!
	var allergyDescriptionLabel: UILabel!
	
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
		
		self.allergyLabel = UILabel(frame: .zero)
		self.allergyLabel.text = "Specify any food allergies here:"
		self.allergyLabel.textColor = UIColor.white
		self.allergyLabel.font = self.titleLabel.font.withSize(30)
		self.allergyLabel.lineBreakMode = .byWordWrapping
		self.allergyLabel.numberOfLines = 0
		self.allergyLabel.textAlignment = .center
		
		self.allergyTextField = UITextField(frame: .zero)
		self.allergyTextField.delegate = self
		self.allergyTextField.setBottomBorder()
		self.allergyTextField.backgroundColor = UIColor.purple
		self.allergyTextField.font = self.foodToUseTextField.font?.withSize(25)
		self.allergyTextField.textColor = UIColor.white
		
		self.allergyDescriptionLabel = UILabel(frame: .zero)
		self.allergyDescriptionLabel.text = "Possible values are: \(allergens)"
		self.allergyDescriptionLabel.textColor = UIColor.white
		self.allergyDescriptionLabel.font = self.titleLabel.font.withSize(15)
		self.allergyDescriptionLabel.lineBreakMode = .byWordWrapping
		self.allergyDescriptionLabel.numberOfLines = 0
		self.allergyDescriptionLabel.textAlignment = .center
		
		self.finishButton = UIButton(frame: .zero)
		self.finishButton.setTitle("Discover Recipes", for: .normal)
		self.finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
		self.finishButton.backgroundColor = UIColor.gray
		self.finishButton.titleLabel?.textColor = UIColor.white
		self.finishButton.addTarget(self, action: #selector(discoverRecipesPressed), for: .touchUpInside)
		self.finishButton.layer.cornerRadius = 10
		
		self.view.addSubview(cancelButton)
		self.view.addSubview(foodToUseTextField)
		self.view.addSubview(titleLabel)
		self.view.addSubview(allergyTextField)
		self.view.addSubview(allergyLabel)
		self.view.addSubview(allergyDescriptionLabel)
		self.view.addSubview(finishButton)
	}
	
	func addSubviewConstraints() {
		self.cancelButton.translatesAutoresizingMaskIntoConstraints = false
		self.cancelButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
		self.cancelButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
		self.cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
		self.titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.titleLabel.topAnchor.constraint(equalTo: self.cancelButton.bottomAnchor, constant: 30).isActive = true
		
		self.foodToUseTextField.translatesAutoresizingMaskIntoConstraints = false
		self.foodToUseTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		self.foodToUseTextField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.foodToUseTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.foodToUseTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		self.foodToUseTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
		
		self.allergyLabel.translatesAutoresizingMaskIntoConstraints = false
		self.allergyLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.allergyLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.allergyLabel.topAnchor.constraint(equalTo: self.foodToUseTextField.bottomAnchor, constant: 100).isActive = true
		
		self.allergyTextField.translatesAutoresizingMaskIntoConstraints = false
		self.allergyTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		self.allergyTextField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.allergyTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.allergyTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		self.allergyTextField.topAnchor.constraint(equalTo: self.allergyLabel.bottomAnchor, constant: 8).isActive = true
		
		self.allergyDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		self.allergyDescriptionLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.allergyDescriptionLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.allergyDescriptionLabel.topAnchor.constraint(equalTo: self.allergyTextField.bottomAnchor, constant: 10).isActive = true
		
		self.finishButton.translatesAutoresizingMaskIntoConstraints = false
		self.finishButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		self.finishButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
		self.finishButton.leftAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
		self.finishButton.rightAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
		
		self.finishButton.topAnchor.constraint(greaterThanOrEqualTo: self.allergyDescriptionLabel.bottomAnchor).isActive = true
		self.finishButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
		self.finishButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
	}
	
	@objc func cancelPressed() {
		guard let delegate = delegate else {
			return
		}
		delegate.cancelFoodSelectionPressed()
	}
	
	@objc func discoverRecipesPressed() {
		guard let delegate = delegate,
		      let ingredients = self.foodToUseTextField.text,
			  let allergies = self.allergyTextField.text else {
			return
		}
		
		self.view.addSubview(spinner)
		
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		spinner.topAnchor.constraint(equalTo: self.foodToUseTextField.bottomAnchor, constant: 20).isActive = true
		
		spinner.startAnimating()
		
		let splitIngredients = ingredients.components(separatedBy: ",")
		let splitAllergies = allergies.components(separatedBy: ",")
		
		delegate.fetchRecipes(ingredients: splitIngredients, allergies: splitAllergies)
	}
}

extension FoodSelectionViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
}
