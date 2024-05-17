//
//  ViewController.swift
//  UIKit-Template
//
//  Created by Charlie Arcodia on 4/19/24.
//

import UIKit

class HomeController: UIViewController {
    
    var welcomeLabel: UILabel = {
        let hfl = UILabel()
        hfl.translatesAutoresizingMaskIntoConstraints = false
        hfl.backgroundColor = .clear
        hfl.textColor = UIColor.black
        hfl.textAlignment = .center
        hfl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        hfl.isUserInteractionEnabled = true
        hfl.numberOfLines = 2
        hfl.text = "Prostackdev\n2024"
        return hfl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        self.addViews()
    }
    
    func addViews() {
        
        // Child views
        self.view.addSubview(self.welcomeLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            self.welcomeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.welcomeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])

        self.welcomeLabel.sizeToFit()
    }
    
    // Test Example
    func additionTest(numberOne: Int, numberTwo: Int) -> Int {
        return numberOne + numberTwo
    }
}

