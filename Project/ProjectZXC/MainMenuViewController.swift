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
        
//        var shitArr: [String] = [String](repeating: " - ", count: 49)
//        
//        shitArr = UserDefaults.standard.array(forKey: "MedalOnLvl") as! [String]
//        
//
//        for index in 0...shitArr.count - 1 {
//            print(shitArr[index] + " <===== ")
//        }
        
        if  topScene > 1 {
            MedalOnLvl = UserDefaults.standard.array(forKey: "MedalOnLvl") as! [Int]
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
