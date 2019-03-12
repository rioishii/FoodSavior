//
//  ExampleViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

	var redView: UIView!
	var nextVCButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		redView = UIView()
		redView.backgroundColor = UIColor.red
		
		nextVCButton = UIButton(frame: CGRect.zero)
		nextVCButton.backgroundColor = UIColor.green
		
		// For buttons, you need to set this state via this method.
		// You CANNOT do something like nextVCButton.titleLabel =
		nextVCButton.setTitle("Press me!", for: UIControl.State.normal)
		
		nextVCButton.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		
		// Step 1. Add views as subviews to View Controller's view
		self.view.addSubview(nextVCButton)
		self.view.addSubview(redView)
		
		// Step 2. Set translate to false
		nextVCButton.translatesAutoresizingMaskIntoConstraints = false
		
		// Step 3. Add anchors / constraints
		nextVCButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
		nextVCButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
		nextVCButton.topAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
		nextVCButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		
		// Step 2. Set translate to false
		redView.translatesAutoresizingMaskIntoConstraints = false
		
		// Step 3. Add anchors / constraints
		redView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
		redView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
		redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
		
		
    }
	
	@objc func buttonPressed() {
		let pushedVC = ExampleViewController()
		
		// Push will add this view controller on to the View Controller Stack
		self.navigationController?.pushViewController(pushedVC, animated: true)
		
		// "Present" will modally (i.e. adding a new contact in Contacts) show
		// this view controller over the current View controller, and then
		// dismissViewController can be called from THIS view controller to remove it
		self.navigationController?.present(pushedVC, animated: true, completion: nil)
	}
}
