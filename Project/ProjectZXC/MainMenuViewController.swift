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
    
    
    override func viewDidLoad() {
        
        topScene = UserDefaults.standard.integer(forKey: "topStage")
        
        //topScene = 0
        
        if  topScene > 10 {
            MedalOnLvl = UserDefaults.standard.array(forKey: "MedalOnLvl") as! [Int]
            indexCharacterTexture = UserDefaults.standard.integer(forKey: "indexCharacterTexture")
            skinCondArr = UserDefaults.standard.array(forKey: "skinCondArr") as! [Int]
            skinBoolArr = UserDefaults.standard.array(forKey: "skinBoolArr") as! [Bool]
        }

        if topScene == 0 {
            topScene = 1
        }
        

        
        self.navigationController?.isNavigationBarHidden = true
        
        for case let button as UIButton in self.view.subviews {
            if button.restorationIdentifier == "goTo" {
                button.setTitle(" "+String(topScene), for: UIControlState.normal)
            }
        }
    }

    
    @IBAction func topScenButton(_ sender: AnyObject) {
        buttonTitle = String(topScene)
        thisScene = topScene
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
    }

    
    
   
    
}
