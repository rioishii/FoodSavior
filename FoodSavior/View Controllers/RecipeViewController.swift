//
//  RecipeViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    let screenSize: CGRect = UIScreen.main.bounds
    private let cellReuseIdentifier = "cellId"
    
    var recipes: [Recipe] = {
       var hamburger = Recipe()
        hamburger.name = "Hamburger"
        hamburger.calories = "Calories: 650"
        hamburger.time = "Time: 30 mins"
        hamburger.cost = "Cost: $3.20"
        
        var pasta = Recipe()
        pasta.name = "Pasta"
        pasta.calories = "Calories: 400"
        pasta.time = "Time: 25 mins"
        pasta.cost = "Cost: $1.50"
        
        var chicken = Recipe()
        chicken.name = "Some Chicken"
        chicken.calories = "Calories: 530"
        chicken.time = "Time: 60 mins"
        chicken.cost = "Cost: $5.50"
        
        return [hamburger, pasta, chicken]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Recipes"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        navigationItem.titleView = titleLabel
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 85, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 85, right: 0)
        
        setupMenuBar()
        setupNavBarButton()
    }
    
    func setupNavBarButton() {
        let settingImage = UIImage(named: "setting")?.withRenderingMode(.alwaysOriginal)
        let settingButton = UIBarButtonItem(image: settingImage, style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.leftBarButtonItem = settingButton
    }
    
    @objc func handleSettings() {
        print(123)
    }
    
    let menuBar: MenuBar = {
       let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! RecipeCell
        cell.recipe = recipes[indexPath.item]
        return cell
    }
	
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}







