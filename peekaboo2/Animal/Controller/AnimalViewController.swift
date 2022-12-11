//
//  animalViewController.swift
//  peekaboo2
//
//  Created by Suzie  on 12/5/22.
//

import UIKit
import AVFoundation

class AnimalViewController: UIViewController {
    
    let animalView = AnimalView() // we initialize the AnimalView (class) so that it is available to be used
    let animalLabel = UILabel()
    let buttonToPeople = UIButton()
    let playButton = UIButton()
    let synthesizer = AVSpeechSynthesizer()
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(animalView)
        setupAnimalView()
        setupGoToPeopleButton()
        playBoo()
    }
     
    func setupAnimalView() {
        //CONSTRAINTS
        animalView.translatesAutoresizingMaskIntoConstraints = false
        animalView.topAnchor.constraint(equalTo: view.topAnchor
        ).isActive = true
        animalView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        animalView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        animalView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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

    
    func playBoo() {
        guard let url = Bundle.main.url(forResource: "Boo", withExtension: "mp3") else { return }

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

}
