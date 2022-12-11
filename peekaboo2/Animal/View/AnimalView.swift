//
//  AnimalView.swift
//  peekaboo2
//
//  Created by Suzie  on 12/10/22.
//

import UIKit
import AVFoundation

//inherits properties of UIView so we use class instead of struct
//subclassing UIView

class AnimalView: UIView {
    
    let imageView = UIImageView()
    var randNum = Int.random(in: 0..<19)
    let labelContainer = UIView()
    let label = UILabel()
    let playButton = UIButton()
    let synthesizer = AVSpeechSynthesizer()
    var player: AVAudioPlayer?
    

    //always do this - initialize with what UIView comes with - frame
    override init(frame: CGRect) { //essentially *like* a viewDidLoad, so all function calls will be done here
        super.init(frame: frame)
        setupAnimalView()
        setupLabelContainerView()
        setupLabel()
        setupPlayButton()
    }
    
    //  xcode provided fix - required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAnimalView() {
        let animal = animalList[randNum]
        let image = UIImage(named: animal.name)
        
        addSubview(imageView) //omit view (view.addSubview) because we are already in a view
        imageView.image = image //set UIImage to our UIImageview for he background
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        //CONSTRAINTS
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
    
    func setupLabelContainerView(){
        addSubview(labelContainer)
        labelContainer.backgroundColor = UIColor.secondarySystemBackground
        labelContainer.layer.cornerRadius = 15
        labelContainer.clipsToBounds = true
        labelContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        // CONSTRAINTS
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.topAnchor.constraint(equalTo: bottomAnchor, constant: -125).isActive = true
        labelContainer.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -30).isActive = true
        labelContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        labelContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
    
    func setupLabel(){
        addSubview(label)
        let animal = animalList[randNum]
        
        label.text = animal.name.uppercased()
        label.textColor = UIColor.label
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        //CONSTRAINTS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: labelContainer.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: labelContainer.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: labelContainer.rightAnchor).isActive = true
    }

    
    func setupPlayButton(){
        addSubview(playButton)
        let playImageConfig = UIImage.SymbolConfiguration(pointSize: 35)
        let playImage = UIImage(systemName: "play.rectangle.fill", withConfiguration: playImageConfig)
        
        playButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        playButton.setImage(playImage, for: .normal)
        playButton.tintColor = UIColor(named: "buttonIcons")
        
        //    CONSTAINTS
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant:  10).isActive = true
        playButton.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant:  -10).isActive = true
        playButton.leftAnchor.constraint(equalTo: labelContainer.leftAnchor).isActive = true
        playButton.rightAnchor.constraint(equalTo: labelContainer.rightAnchor, constant:  300).isActive = true
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

