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
public var MainBGPub = 0

class MainMenuViewController: UIViewController {
    
    

    @IBOutlet weak var MainChar: UIImageView!
  
    @IBOutlet weak var MainBG: UIImageView!
    
    @IBOutlet weak var shadowMainChar: UIImageView!
    
    override func viewDidLoad() {
        

        
        shadowMainChar.image =  UIImage(named: "shadow")
        
        topScene = UserDefaults.standard.integer(forKey: "topStage")
        
        //topScene = 0
        print("До " + String(describing: skinCondArr))
        print("До " + String(describing: skinBoolArr))
        if  topScene > 1 {
            MainBGPub = UserDefaults.standard.integer(forKey: "MainBGPub")
            MedalOnLvl = UserDefaults.standard.array(forKey: "MedalOnLvl") as! [Int]
            indexCharacterTexture = UserDefaults.standard.integer(forKey: "indexCharacterTexture")
            skinCondArr = UserDefaults.standard.array(forKey: "skinCondArr") as! [Int]
            print("После " + String(describing: skinCondArr))
            skinBoolArr = UserDefaults.standard.array(forKey: "skinBoolArr") as! [Bool]
            print("После " + String(describing: skinBoolArr))
        }

        if topScene == 0 {
            topScene = 1
        }
        
        topScene = 64
        
        MainChar.image = UIImage(named: "MainCharacter" + String(indexCharacterTexture))
        
        if MainBGPub == 0 {
            MainBG.image = UIImage(named: "ConBG1")
        }
        else {
            MainBG.image = UIImage(named: "MenuBg" + String(MainBGPub))
        }


        
        self.navigationController?.isNavigationBarHidden = true
        
        for case let button as UIButton in self.view.subviews {
            if button.restorationIdentifier == "goTo" {
                button.setTitle(" "+String(topScene), for: UIControl.State.normal)
            }
        }
    }

    
    @IBAction func topScenButton(_ sender: AnyObject) {
        buttonTitle = String(topScene)
        thisScene = topScene
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
    }

    
    
   
    
}
