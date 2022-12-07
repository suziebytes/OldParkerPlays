//
//  animalViewController.swift
//  peekaboo2
//
//  Created by Suzie  on 12/5/22.
//

import UIKit
import AVFoundation

class AnimalViewController: UIViewController {
    
    //create a card view using UIImageview
    let animalView = UIImageView()
    var randNum = Int.random(in: 0..<19)
    let animalList = [Animal(name: "Ant"), Animal(name: "Bird"), Animal(name: "Cat"), Animal(name: "Chicken"), Animal(name: "Cow"), Animal(name: "Dog"), Animal(name: "Duck"), Animal(name: "Giraffe"),Animal(name: "Horse"), Animal(name: "Jelly Fish"), Animal(name: "Fish"), Animal(name: "Lion"), Animal(name: "Lizard"), Animal(name: "Monkey"), Animal(name: "Panda"), Animal(name: "Pig"), Animal(name: "Shark"), Animal(name: "Skunk"), Animal(name: "Tiger"), Animal(name: "Zebra")]
    
    let labelContainerView = UIView()
    let animalLabel = UILabel()
    
    let buttonToPeople = UIButton()
    let playButton = UIButton()
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupAnimalView()
        setupLabelContainerView()
        setupLabel()
        setupGoToPeopleButton()
        setupPlayButton()
    }
    
    func setupAnimalView() {
        let animal = animalList[randNum]
        let image = UIImage(named: animal.name)
        
        view.addSubview(animalView)
        animalView.image = image //set UIImage to our UIImageview for he background
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
        let animal = animalList[randNum]
        
        animalLabel.text = animal.name.uppercased()
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
    
    func setupGoToPeopleButton(){
        view.addSubview(buttonToPeople)
        buttonToPeople.addTarget(self, action: #selector(goBackToPeople), for: .touchUpInside)
        buttonToPeople.backgroundColor = .clear
        
        //CONSTRAINTS
        buttonToPeople.translatesAutoresizingMaskIntoConstraints = false
        buttonToPeople.topAnchor.constraint(equalTo: animalView.topAnchor, constant: 100).isActive = true
        buttonToPeople.bottomAnchor.constraint(equalTo: animalView.bottomAnchor, constant: -100).isActive = true
        buttonToPeople.leftAnchor.constraint(equalTo: animalView.leftAnchor).isActive = true
        buttonToPeople.rightAnchor.constraint(equalTo: animalView.rightAnchor).isActive = true
    }
    
    @objc func goBackToPeople(sender: UIButton){
        let peopleViewController = PeopleViewController()
        self.present(peopleViewController, animated: true, completion: nil)
        
    }
    
    func setupPlayButton(){
        view.addSubview(playButton)
        let playImageConfig = UIImage.SymbolConfiguration(pointSize: 35)
        let playImage = UIImage(systemName: "play.rectangle.fill", withConfiguration: playImageConfig)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        playButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        playButton.setImage(playImage, for: .normal)
        
        //    CONSTAINTS
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: labelContainerView.topAnchor, constant:  10).isActive = true
        playButton.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor, constant:  -10).isActive = true
        playButton.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        playButton.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor, constant:  300).isActive = true
    }
    
    @objc func playSound(sender: UIButton){
        //this function will use the AV to play the sound
        let animal = animalList[randNum]
        
        let utterance = AVSpeechUtterance(string: animal.name)
        utterance.rate = 0.1
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
        

    }
}