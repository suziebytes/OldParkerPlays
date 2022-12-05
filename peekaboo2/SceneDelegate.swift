//
//  SceneDelegate.swift
//  peekaboo2
//
//  Created by Suzie  on 12/4/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // One 
        self.window = UIWindow(windowScene: windowScene)
        // Two - first view controller you will see
        self.window?.rootViewController = ViewController()
        // Three
        self.window?.makeKeyAndVisible()
    }
}
