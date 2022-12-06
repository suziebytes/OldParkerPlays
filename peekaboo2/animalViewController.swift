//
//  animalViewController.swift
//  peekaboo2
//
//  Created by Suzie  on 12/5/22.
//

import UIKit

class AnimalViewController: UIViewController {
    
    //create a card view using UIImageview
    let animalView = UIImageView()
    var randNum = Int.random(in: 0..<19)
   
    let animalList = ["Ant", "Bird", "Cat", "Chicken", "Cow", "Dog", "Duck", "Giraffe", "Horse", "Jelly Fish", "Lion", "Lizard", "Monkey", "Panda", "Pig", "Shark", "Skunk", "Tiger", "Zabra" ]
    
    let labelContainerView = UIView()
    let animalLabel = UILabel()

   
    //create a label using UILabel
    
    //create UIImage for our sound image button - use UIbutton and set background to sound image instead?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupAnimalView()
        setupLabelContainerView()
        setupLabel()
        
    }
    
    func setupAnimalView(){
        let animalImage = animalList[randNum]

        view.addSubview(animalView)
        animalView.image = UIImage(named: animalImage)  //set UIImage to our UIImageview for he background
        animalView.layer.cornerRadius = 15
        animalView.contentMode = .scaleAspectFill
        animalView.clipsToBounds = true
        
        //CONSTRAINTS
        animalView.translatesAutoresizingMaskIntoConstraints = false
        animalView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        animalView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        animalView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        animalView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func setupLabelContainerView(){
        view.addSubview(labelContainerView)
        labelContainerView.backgroundColor = .white
        labelContainerView.layer.cornerRadius = 15
        labelContainerView.clipsToBounds = true
        labelContainerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        // CONSTRAINTS
        labelContainerView.translatesAutoresizingMaskIntoConstraints = false
        labelContainerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -125).isActive = true
        labelContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        labelContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        labelContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func setupLabel(){
       view.addSubview(animalLabel)
        animalLabel.text = animalList[randNum].uppercased()
        animalLabel.backgroundColor = .white
        animalLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        animalLabel.layer.cornerRadius = 15
        animalLabel.clipsToBounds = true
        animalLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
        //CONSTRAINTS
        animalLabel.translatesAutoresizingMaskIntoConstraints = false
        animalLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor).isActive = true
        animalLabel.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor).isActive = true
        animalLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor, constant: 10).isActive = true
        animalLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
    }
}

