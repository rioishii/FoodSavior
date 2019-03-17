//
//  RecipeViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

	var tableView: UITableView!
	var delegate: UITableViewDelegate?
	var dataSource: UITableViewDataSource?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.tableView = UITableView(frame: CGRect.zero)
		
		self.view.addSubview(tableView)
		
        self.addConstraints()
    }
	
	// TODO: Fill in this method appropriately
	func addConstraints() {
		
		// Table view constraints
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
		self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
		self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
	}
}

extension RecipeViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
		
		guard let unwrappedCell = cell else {
			return UITableViewCell()
		}
		
		return unwrappedCell
	}
}

extension RecipeViewController: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	// Use this to move on to the Recipe Details View Controller, passing the proper data
		
		
		
	}
}


