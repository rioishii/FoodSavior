//
//  RecipeContainerCell.swift
//  FoodSavior
//
//  Created by Rio Ishii on 3/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeContainerCell: UICollectionViewCell {
    
    var tableView: UITableView
    
    var recipes: [Recipe] = []
    
    let cellReuseIdentifier = "tableViewCellId"
    
    override init(frame: CGRect) {
        self.tableView = UITableView(frame: .zero)
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        setupSubviews()
        addSubviewConstraints()
    }
    
    func setupSubviews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(RecipeCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.addSubview(self.tableView)
    }
    
    func addSubviewConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK - TableView Data Source

extension RecipeContainerCell: UITableViewDataSource {
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
        
        
        //        NOTE: THE FOLLOWING SHOULD ONLY BE UNCOMMENTTED IF REQUESTS ARE BEING MADE
        //        let recipe = recipes[indexPath.row]
        //
        //        cell.recipeImageView.image = recipeImages[recipe]
        //        cell.nameLabel.text = recipe.name
        //        cell.timeLabel.text = "\(recipe.readyInMinutes) minutes"
        
        cell.recipeImageView.image = UIImage(named: "Hamburger")
        cell.nameLabel.text = "Test"
        cell.timeLabel.text = "10 minutes"
        
        return cell
    }
}

// MARK - TableView Delegate

extension RecipeContainerCell: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do any setup when the cell is selected
        
        
    }
}
