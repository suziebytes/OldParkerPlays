//
//  peopleViewController.swift
//  peekaboo2
//
//  Created by Suzie  on 12/4/22.
//

import UIKit

class PeopleViewController: UIViewController {
    let imageView = UIImageView() //this is the image card
    let imageName = String(Int.random(in: 0..<20)) //Images are named from 1-20
    let buttonToAnimal = UIButton()
    let animalViewcontroller : AnimalViewController = AnimalViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupImageView()
        setupbuttonToAnimals()
    }

    func setupImageView() {
        view.addSubview(imageView)
        imageView.image = UIImage(named: imageName) //sets background image
        imageView.layer.cornerRadius = 15
        //how to set aspect ratio for imageView, which contains bg image imageName
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        //CONSTRAINT
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func setupbuttonToAnimals(){
        view.addSubview(buttonToAnimal)
        buttonToAnimal.addTarget(self, action: #selector(goToAnimal), for: .touchUpInside)
        buttonToAnimal.backgroundColor = .clear
        buttonToAnimal.layer.cornerRadius = 15
        
        //CONSTRAINTS
        buttonToAnimal.translatesAutoresizingMaskIntoConstraints = false
        buttonToAnimal.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        buttonToAnimal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        buttonToAnimal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        buttonToAnimal.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    @objc func goToAnimal(sender:UIButton) {
        self.present(animalViewcontroller, animated: true, completion: nil)
    }
}
