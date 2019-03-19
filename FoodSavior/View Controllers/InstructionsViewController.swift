//
//  InstructionsViewController.swift
//  FoodSavior
//
//  Created by Dustin Langner on 3/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
	
	let instructions: [Instruction]
	var currentInstructionIndex = 0
	
	let colors = [UIColor.rgb(red: 138, green: 43, blue: 226),
				  UIColor.rgb(red: 128, green: 0, blue: 0),
				  UIColor.rgb(red: 100, green: 149, blue: 237),
				  UIColor.rgb(red: 255, green: 165, blue: 0)]
	
	let numberLabel: UILabel
	let instructionTextLabel: UILabel
	let previousButton: UIButton
	let nextButton: UIButton
	
	init(instructions: [Instruction]) {
		self.instructions = instructions
		
		self.numberLabel = UILabel()
		self.instructionTextLabel = UILabel()
		self.previousButton = UIButton()
		self.nextButton = UIButton()
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = colors[0]
		navigationItem.title = "Instructions"
		let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
		navigationController?.navigationBar.titleTextAttributes = textAttributes
		
		setupViews()
		addSubviewConstraints()
        // Do any additional setup after loading the view.
    }
	
	func setupViews() {
		let firstInstruction = instructions[0]
		
		self.numberLabel.text = "\(firstInstruction.number)"
		self.numberLabel.font = self.numberLabel.font.withSize(50)
		self.numberLabel.textAlignment = .center
		self.numberLabel.textColor = UIColor.white
		
		self.instructionTextLabel.text = firstInstruction.stepText
		self.instructionTextLabel.numberOfLines = 0
		self.instructionTextLabel.lineBreakMode = .byWordWrapping
		self.instructionTextLabel.adjustsFontSizeToFitWidth = true
		self.instructionTextLabel.font = self.instructionTextLabel.font.withSize(25)
		self.instructionTextLabel.textColor = UIColor.white
		self.instructionTextLabel.textAlignment = .center
		
		self.previousButton.setTitle("Previous", for: .normal)
		self.previousButton.backgroundColor = UIColor.gray
		self.previousButton.addTarget(self, action: #selector(showPreviousInstruction), for: .touchUpInside)
		self.previousButton.layer.cornerRadius = 10
		
		self.nextButton.setTitle("Next", for: .normal)
		self.nextButton.backgroundColor = UIColor.gray
		self.nextButton.addTarget(self, action: #selector(showNextInstruction), for: .touchUpInside)
		self.nextButton.layer.cornerRadius = 10
		
		self.view.addSubview(numberLabel)
		self.view.addSubview(instructionTextLabel)
		self.view.addSubview(previousButton)
		self.view.addSubview(nextButton)
	}

	func addSubviewConstraints() {
		self.numberLabel.translatesAutoresizingMaskIntoConstraints = false
		self.numberLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		self.numberLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
		self.numberLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 8).isActive = true
		
		self.instructionTextLabel.translatesAutoresizingMaskIntoConstraints = false
		self.instructionTextLabel.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 30).isActive = true
		self.instructionTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		self.instructionTextLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.instructionTextLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.instructionTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.previousButton.topAnchor, constant: -16).isActive = true
		
		self.previousButton.translatesAutoresizingMaskIntoConstraints = false
		self.previousButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
		self.previousButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
		self.previousButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		self.previousButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
		
		self.nextButton.translatesAutoresizingMaskIntoConstraints = false
		self.nextButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
		self.nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
		self.nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		self.nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
		self.nextButton.leftAnchor.constraint(greaterThanOrEqualTo: self.previousButton.rightAnchor, constant: 20).isActive = true
	}
	
	@objc func showNextInstruction() {
		if currentInstructionIndex + 1 < instructions.count {
			currentInstructionIndex += 1
			setInstructions(forIndex: currentInstructionIndex)
		}
	}
	
	@objc func showPreviousInstruction() {
		if currentInstructionIndex > 0 {
			currentInstructionIndex -= 1
			setInstructions(forIndex: currentInstructionIndex)
		}
	}
	
	func setInstructions(forIndex index: Int) {
		UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
			self.view.backgroundColor = self.colors[index % 4]
			self.navigationController?.navigationBar.backgroundColor = self.colors[index % 4]
			self.numberLabel.text = "\(self.instructions[index].number)"
			self.instructionTextLabel.text = self.instructions[index].stepText
		}, completion: nil)
	}
}
