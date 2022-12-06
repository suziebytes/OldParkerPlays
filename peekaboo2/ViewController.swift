//
//  ViewController.swift
//  peekaboo2
//
//  Created by Suzie  on 12/4/22.
//

import UIKit

class ViewController: UIViewController {
    let headerLabel = UILabel() //UILabel is a class - class is uppercase, func is lowercase
    let peekabooLabel = UILabel()
    let startButton = UIButton(type: .system)
    let peopleViewcontroller = PeopleViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupHeaderLabel()
        setupPeekaBooLabel()
        setupStartButton()
    }
    
    
    func setupHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.text = "LET'S PLAY"
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        
        //CONSTRANTS
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    func setupPeekaBooLabel() {
        view.addSubview(peekabooLabel)
        peekabooLabel.text = "PEEK A BOO"
        peekabooLabel.textColor = .white
        peekabooLabel.font = UIFont.systemFont(ofSize: 50, weight: .medium)
        
        //CONSTRAINTS
        //10 from setupHeaderLabel()
        peekabooLabel.translatesAutoresizingMaskIntoConstraints = false
        peekabooLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //how to add constraint for this based on distance from 'let's play' and not .view
        peekabooLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupStartButton() {
        view.addSubview(startButton)
        startButton.addTarget(self, action:#selector(startGame), for: .touchUpInside)
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        
        startButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = 15
        
        //CONSTRAINTS
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive
        = true
        //use constraints to create size / height-width of button
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    @objc func startGame(sender:UIButton) {
        self.present(peopleViewcontroller, animated: true, completion: nil)
    }
}




//
//
//class Animal {
//    let name: String
//    let color: String
//
//    // you always ened to initaite your properties (add arguments property: Type then inside the function self.property = property
//    init(name: String, color: String) {
//        self.name = name
//        self.color = color
//    }
//}


/*CONSTRAINTS -- ALWAYS DO THIS for every single view
 for every view:
 1. disable constraints in storyboard by setting property to false
 a) property.translatesAutoresizingMaskIntoConstraints = false
 2. Create your constraint
 a) property.locationOfConstraint(equalTo: view.locationOfConstraint)
    ex:  headerLabel.topAnchor.constraint(equalTo: view.topAnchor)
 3. Make sure your constraint is ACTIVE by setting it to true
    ex : headerLabel.topAnchor.constraint(equalTo: view.topAnchor) = true
 */
 
