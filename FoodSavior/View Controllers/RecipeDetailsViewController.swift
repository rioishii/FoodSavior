//
//  RecipeDetailsViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
	let scrollView = UIScrollView()
	let contentView = UIView()
	
	var details: RecipeDetail!
	var instructions: [Instruction?]!
	
	var foodImage: UIImageView!
	var foodNameLabel: UILabel!
	
	var caloriesLabel: UILabel!
	var servingsLabel: UILabel!
	
	var timeLabel: UILabel!
	var basicInfoStackView: UIStackView!
	var ingredientStackView: UIView!
	var nutritionStackView: UIView!
	var startCookButton: UIButton!
	
	init(details: RecipeDetail, image: UIImage) {
		self.details = details
		
		self.foodImage = UIImageView(frame: .zero)
		self.foodImage.image = image
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.instructions = details.instructions
		
		setupScrollView()
		setupView()
	}
	
	func setupScrollView(){
		self.view.backgroundColor = .white
		
		// set to false
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		// add subViews
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		
		// scrollView Constraints
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		
		// ContentView Constraints
		contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
	}
	
	// creates all the view
	func setupView() {
		configureImage()
		configureTitle()
		configureBasicInfo()
		configureButton()
		
		
		let ingredientsStrings = details.ingredients.map { (ingredient) -> String in
			guard let ingredient = ingredient else {
				return ""
			}
			return ingredient.name
		}
		self.ingredientStackView = ListView(title: "Ingredients", items: ingredientsStrings)
		self.nutritionStackView = ListView(title: "Nutrition Facts", items: ["This is an item!"])
		
		self.contentView.addSubview(ingredientStackView)
		self.contentView.addSubview(nutritionStackView)
		
		addSubviewConstraints()
	}
	
	func addSubviewConstraints() {
		foodImage.translatesAutoresizingMaskIntoConstraints = false
		foodImage.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
		foodImage.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
		foodImage.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
		foodImage.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
		
		foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
		constraints(view1: foodNameLabel, view2: foodImage, space: 8)
		
		basicInfoStackView.translatesAutoresizingMaskIntoConstraints = false
		constraints(view1: basicInfoStackView, view2: foodNameLabel, space: 8)
		
		startCookButton.translatesAutoresizingMaskIntoConstraints = false
		constraints(view1: startCookButton, view2: basicInfoStackView, space: 20)
		
		ingredientStackView.translatesAutoresizingMaskIntoConstraints = false
		constraints(view1: ingredientStackView, view2: startCookButton, space: 20)
		
		nutritionStackView.translatesAutoresizingMaskIntoConstraints = false
		constraints(view1: nutritionStackView, view2: ingredientStackView, space: 16)
		nutritionStackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
	}
	
	func configureImage() {
		self.foodImage.contentMode = .scaleAspectFill
		self.foodImage.clipsToBounds = true
		
		self.view.addSubview(self.foodImage)
	}

	func configureTitle() {
		self.foodNameLabel = UILabel()
		self.foodNameLabel.text = self.details.recipeName
		
		self.foodNameLabel.font = self.foodNameLabel.font.withSize(34)
		self.foodNameLabel.lineBreakMode = .byWordWrapping
		self.foodNameLabel.numberOfLines = 0
		self.foodNameLabel.textAlignment = .center
		
		self.contentView.addSubview(foodNameLabel)
	}
	
	// creates the basic information
	func configureBasicInfo() {
		servingsLabel = UILabel()
		servingsLabel.text = "Servings: \(details.servings)"
		servingsLabel.font = servingsLabel.font.withSize(15)
		servingsLabel.lineBreakMode = .byWordWrapping
		servingsLabel.numberOfLines = 0
		
		timeLabel = UILabel()
		timeLabel.text = "Ready in: \(details.readyInMinutes) Minutes"
		timeLabel.font = timeLabel.font.withSize(15)
		timeLabel.lineBreakMode = .byWordWrapping
		timeLabel.numberOfLines = 0
		
		basicInfoStackView = UIStackView(arrangedSubviews: [servingsLabel, timeLabel])
		basicInfoStackView.axis = .horizontal
		basicInfoStackView.alignment = .center
		basicInfoStackView.distribution = .equalCentering
		self.contentView.addSubview(basicInfoStackView)
	}
	
	// creates start button
	func configureButton() {
		startCookButton = UIButton(type: .custom)
		startCookButton.setTitle("Start Cooking!", for: .normal)
		startCookButton.setTitleColor(.black, for: .normal)
		startCookButton.backgroundColor = .green
		startCookButton.layer.cornerRadius = 10
		startCookButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
		self.contentView.addSubview(startCookButton)
	}
	
	// creates ingredientStackViewients section
	func createIngred(stackView: UIView) {
		self.contentView.addSubview(stackView)
	}
	
	// creates nutritionStackViewition section
	func createNutr(stackView: UIView) {
		self.contentView.addSubview(stackView)
	}
	
	@objc func buttonClicked(sender: UIButton) {
		
		
		
		
		
		

	}
	
	// creates constraints
	func constraints(view1: UIView, view2: UIView, space: CGFloat) {
		view1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
		view1.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: space).isActive = true
		view1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
	}
}
