//
//  RecipeDetailsViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reservingsLabeled.
//

import UIKit
//
class InstructionsViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    var prevButton: UIButton!
    var nextButton: UIButton!
    var stepLabel: UILabel!
    var instructionLabel: UILabel!
    var buttonStackView: UIStackView!

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupView()
    }
   
    
    func setupScrollView(){
        self.view.backgroundColor = UIColor.white /* #ffcc00 */
    
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
    
    func setupView() {
        stepLabel = UILabel()
        stepLabel.textAlignment = .center
        stepLabel.text = "Step 1"
        
        stepLabel.lineBreakMode = .byWordWrapping
        stepLabel.numberOfLines = 0
        
        stepLabel.font = stepLabel.font.withSize(30)
        
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(stepLabel)
        
        stepLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        stepLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        stepLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true

        
        instructionLabel = UILabel()
        instructionLabel.textAlignment = .center
        instructionLabel.text = "baked chickenbaked chickenbaked chickenbaked chickenbaked chickenbaked chickenbaked chicken"
        
        instructionLabel.lineBreakMode = .byWordWrapping
        instructionLabel.numberOfLines = 0
        
        instructionLabel.font = instructionLabel.font.withSize(30)
        
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(instructionLabel)
        
        instructionLabel.topAnchor.constraint(equalTo: stepLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        instructionLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        instructionLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
//
        prevButtonMethod()
       // nextButtonMethod()
     }
    
    func prevButtonMethod() {
        prevButton = UIButton(type: .system)
        prevButton.setTitleColor(UIColor.black, for: .normal)
        prevButton.setTitle("Previous", for: .normal)
        prevButton.backgroundColor = UIColor.rgb(red: 34, green: 139, blue: 34)
        prevButton.addTarget(self, action: #selector(printStuff), for: .touchUpInside)
  
        
        nextButton = UIButton(type: .system)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor.rgb(red: 34, green: 139, blue: 34)
        nextButton.addTarget(self, action: #selector(printStuff), for: .touchUpInside)
        
        buttonStackView = UIStackView(arrangedSubviews: [prevButton, nextButton])
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        
        self.contentView.addSubview(buttonStackView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true


//        prevButton.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor).isActive = true
//        prevButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        prevButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        prevButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    
//    func nextButtonMethod() {
//        nextButton = UIButton(type: .system)
//        nextButton.setTitleColor(UIColor.green, for: .normal)
//        nextButton.setTitle("Previous", for: .normal)
//        nextButton.backgroundColor = UIColor.brown
//        nextButton.addTarget(self, action: #selector(printStuff), for: .touchUpInside)
//        self.contentView.addSubview(prevButton)
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//
//        nextButton.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor).isActive = true
//        nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        nextButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        nextButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
//    }
    @objc func printStuff() {
        
    }
}
