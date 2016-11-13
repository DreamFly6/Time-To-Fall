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
        print("Жопа")
        
        if (UserDefaults.standard.integer(forKey: "topStage") == nil) {
            print("================================")
            print("================================")
            print("====NIL NIL NIL NIL NIL NIL=====")
            print("================================")
            print("================================")
            print("================================")
            topScene = 1
        }
        else{
            print("================================")
            print("================================")
            print("=++++++++++++++++++++++++++++++=")
            print("================================")
            print("================================")
            print("================================")
            topScene = UserDefaults.standard.integer(forKey: "topStage")
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
