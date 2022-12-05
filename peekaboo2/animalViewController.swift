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
    var randNum = Int.random(in: 0..<20)
   
    let animalList = ["Ant", "Bird", "Cat", "Chicken", "Cow", "Dog", "Duck", "Giraffe", "Horse", "Jelly Fish", "Lion", "Lizard", "Monkey", "Panda", "Pig", "Shark", "Skunk", "Tiger", "Zabra" ]
   
    //create a label using UILabel
    
    //create UIImage for our sound image button - use UIbutton and set background to sound image instead?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupAnimalView()
        
    }
    
    func setupAnimalView(){
        let animalImage = animalList[randNum]

        view.addSubview(animalView)
        animalView.image = UIImage(named: animalImage)  //set UIImage to our UIImageview for he background
        animalView.layer.cornerRadius = 15
        animalView.clipsToBounds = true
        
        //CONSTRAINTS
        animalView.translatesAutoresizingMaskIntoConstraints = false
        animalView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        animalView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        animalView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        animalView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
    }
}

