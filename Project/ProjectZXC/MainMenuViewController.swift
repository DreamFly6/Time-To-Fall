//
//  MainMenuViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 07.11.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit



class MainMenuViewController: UIViewController {
  
    @IBAction func topScenButton(_ sender: AnyObject) {
        buttonTitle = String(topScene)
        thisScene = topScene
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
    }

    
    
   
    
}
