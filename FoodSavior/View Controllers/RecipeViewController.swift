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
		
		// do some tableview set up
		// Don't forget to set the dataSource and delegate!
		// i.e. tableView.delegate = self, etc

		// Do any other setup
		
        self.addConstraints()
    }
	
	// TODO: Fill in this method appropriately
	func addConstraints() {
		
		
		
		
	}
}

extension RecipeViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		<#code#>
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		<#code#>
	}
}

extension RecipeViewController: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	// Use this to move on to the Recipe Details View Controller, passing the proper data
		
		
		
	}
}


