//
//  RecipeDetailsViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/11/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    var titlelabel : UILabel!
    var time : UILabel!
    var cost : UILabel!
    var cal : UILabel!
    var serv : UILabel!
    var stackView : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        title()
    }

    func title() {
        // create title
        titlelabel = UILabel()
        titlelabel.text = "Nachos"
        titlelabel.sizeToFit()
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        
        // create time
        time = UILabel()
        time.text = "Minutes: 60"
        time.sizeToFit()
        time.translatesAutoresizingMaskIntoConstraints = false
        
        // create serving
        serv = UILabel()
        serv.text = "Servings: 2"
        serv.sizeToFit()
        serv.translatesAutoresizingMaskIntoConstraints = false
        
        // create cal
        cal = UILabel()
        cal.text = "Calories: 250"
        cal.sizeToFit()
        cal.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fill // .fillEqually .fillProportionally .equalSpacing .equalCentering
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(titlelabel)
        stackView.addArrangedSubview(time)
        stackView.addArrangedSubview(serv)
        stackView.addArrangedSubview(cal)
        
        stackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
}
