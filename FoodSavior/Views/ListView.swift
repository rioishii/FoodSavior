//
//  ListView.swift
//  FoodSavior
//
//  Created by Phillip Park on 3/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    let stackView: UIStackView!
    var items: [String]
    var titleLabel: UILabel
    
    init(title: String, items: [String]) {
        self.titleLabel = UILabel(frame: .zero)
        self.titleLabel.text = title
        self.titleLabel.font = UIFont(name: "ProximaNova-Bold", size: 17)
        self.titleLabel.lineBreakMode = .byWordWrapping
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        self.items = items
        self.stackView = UIStackView()
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.spacing = 2
        super.init(frame: .zero)
        
        self.stackView.addArrangedSubview(titleLabel)
        
        for item in items {
            let label = createListItem(itemString: item)
            self.stackView.addArrangedSubview(label)
        }
        addSubviewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviewConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.stackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.stackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func createListItem(itemString: String) -> UILabel {
        let label = UILabel()
        label.text = "•  \(itemString)"
        label.font = UIFont(name: "ProximaNova-Reg", size: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }
}
