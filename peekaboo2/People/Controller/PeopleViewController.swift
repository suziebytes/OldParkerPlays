//
//  peopleViewController.swift
//  peekaboo2
//
//  Created by Suzie  on 12/4/22.
//

import UIKit
import AVFoundation

class PeopleViewController: UIViewController {
    let imageView = UIImageView() //this is the image card
    let imageName = String(Int.random(in: 0..<20)) //Images are named from 1-20
    let buttonToAnimal = UIButton()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
//
        playSound()
        setupImageView()
        setupbuttonToAnimals()
        
    }
 
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        setupImageView()
//        setupbuttonToAnimals()
//    }

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
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Peek A ", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func goToAnimal(sender:UIButton) {
        let animalViewController = AnimalViewController()
        self.present(animalViewController, animated: true, completion: nil)
    }
    

}
