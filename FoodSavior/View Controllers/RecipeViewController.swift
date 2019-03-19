//
//  RecipeViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    private let cellReuseIdentifier = "cellIdentifier"
	
	var tableView: UITableView!
	var noDataLabel: UILabel!
	
	var menuBar: MenuBar!
	
	var recipes: [Recipe] = []
	var recipeImages: [Recipe : UIImage] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.rgb(red: 34, green: 139, blue: 34)
		
		// ORDER MATTERS: This needs to be done before the table view is set up
		setupNavigationBar()
		
		self.setupSubviews()
		self.addSubviewConstraints()
    }
	
	func getRecipeData() {
		let operationQueue = OperationQueue()
		let dispatchGroup = DispatchGroup()
		
		// Gets most of the recipe data
		let getRecipeData = BlockOperation {
			dispatchGroup.enter()
			RecipeAPI.getRecipes(withIngredients: ["chicken"]) { [weak self] (recipes) in
				guard let strongSelf = self,
					let safeRecipes = recipes else {
						// do some error handling
						return
				}
				strongSelf.recipes = safeRecipes
				dispatchGroup.leave()
			}
			dispatchGroup.wait()
		}
		
		// From the recipe data, fetches the actual image for the given recipe
		let getRecipeImages = BlockOperation {
			for recipe in self.recipes {
				guard let imageUrl = URL(string: recipe.imageUrl) else {
					continue
				}
				dispatchGroup.enter()
				RecipeAPI.getRecipeImage(from: imageUrl, completion: { [weak self] (data, response, error) in
					if let strongSelf = self,
					   let data = data,
					   let image = UIImage(data: data) {
						strongSelf.recipeImages[recipe] = image
					}
					dispatchGroup.leave()
				})
			}
			dispatchGroup.wait()
		}
		
		// Updates the UI accordingly
		let updateUI = BlockOperation {
			dispatchGroup.enter()
			DispatchQueue.main.async {
				if (self.tableView != nil) {
					self.tableView.reloadData()
				} else {
					self.setupSubviews()
					self.addSubviewConstraints()
				}
			}
			dispatchGroup.leave()
		}
		
		getRecipeImages.addDependency(getRecipeData)
		updateUI.addDependency(getRecipeImages)
		
		operationQueue.addOperation(getRecipeData)
		operationQueue.addOperation(getRecipeImages)
		operationQueue.addOperation(updateUI)
	}

	
	func setupSubviews() {
		self.tableView = UITableView(frame: .zero)
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		 self.tableView.register(RecipeCell.self, forCellReuseIdentifier: cellReuseIdentifier)
		self.view.addSubview(self.tableView)
	}
	
	func addSubviewConstraints() {
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.tableView.topAnchor.constraint(equalTo: self.menuBar.bottomAnchor).isActive = true
		self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
		self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
		self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
	
	// MARK - Navigation Bar
	
	func setupNavigationBar() {
		navigationController?.navigationBar.isTranslucent = false
		
		let titleLabel = UILabel()
		titleLabel.text = "Recipes"
		titleLabel.textColor = UIColor.white
		titleLabel.font = UIFont.systemFont(ofSize: 25)
		navigationItem.titleView = titleLabel
		
		navigationItem.leftBarButtonItem = createNavBarButton(withImage: "setting", action: #selector(handleSettings), dimension: 40)
		navigationItem.rightBarButtonItem = createNavBarButton(withImage: "fridge", action: #selector(handleAddFoodSelected), dimension: 40)
		
		menuBar = MenuBar(frame: .zero)
		self.view.addSubview(menuBar)
		
		self.menuBar.translatesAutoresizingMaskIntoConstraints = false
		self.menuBar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
		self.menuBar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
		self.menuBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
		self.menuBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
	}
	
	func createNavBarButton(withImage image: String, action: Selector, dimension: CGFloat) -> UIBarButtonItem {
		let button = UIButton()
		button.setImage(UIImage(named: image), for: .normal)
		button.addTarget(self, action: action, for: .touchUpInside)

		let barItem = UIBarButtonItem(customView: button)
		barItem.tintColor = UIColor.black
		barItem.customView?.widthAnchor.constraint(equalToConstant: dimension).isActive = true
		barItem.customView?.heightAnchor.constraint(equalToConstant: dimension).isActive = true
		
		return barItem
	}
	
	@objc func handleSettings() {
		
	}
	
	@objc func handleAddFoodSelected() {
		let foodSelectionViewController = FoodSelectionViewController()
		foodSelectionViewController.delegate = self
		
		foodSelectionViewController.modalTransitionStyle = .crossDissolve
		foodSelectionViewController.modalPresentationStyle = .fullScreen
		
		self.present(foodSelectionViewController, animated: true, completion: nil)
	}
}

// MARK - TableView Data Source

extension RecipeViewController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
		// NOTE: THE FOLLOWING SHOULD ONLY BE UNCOMMENTTED IF REQUESTS ARE BEING MADE
		// return self.recipes.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? RecipeCell else {
			return UITableViewCell()
		}
		
		cell.preservesSuperviewLayoutMargins = false
		cell.separatorInset = UIEdgeInsets.zero
		cell.layoutMargins = UIEdgeInsets.zero
		
		
//		NOTE: THE FOLLOWING SHOULD ONLY BE UNCOMMENTTED IF REQUESTS ARE BEING MADE
//		let recipe = recipes[indexPath.row]
//
//		cell.recipeImageView.image = recipeImages[recipe]
//		cell.nameLabel.text = recipe.name
//		cell.timeLabel.text = "\(recipe.readyInMinutes) minutes"
		
		cell.recipeImageView.image = UIImage(named: "Hamburger")
		cell.nameLabel.text = "Test"
		cell.timeLabel.text = "10 minutes"
		
		return cell
	}
}

// MARK - TableView Delegate

extension RecipeViewController: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// do any setup when the cell is selected
		
		
	}
}

extension RecipeViewController: FoodSelectionDelegate {
	func cancelFoodSelectionPressed() {
		self.dismiss(animated: true) {
			
		}
	}
}
