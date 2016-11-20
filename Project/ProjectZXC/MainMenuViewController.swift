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

public var thisScene = 1
public var topScene = 0
public var topActualScene = 26
public var statsАrray: [[Int]] = [[Int]](repeating:[Int](repeating:0, count: 5), count:64)
public var buttonTitle : String = ""

class MainMenuViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        topScene = UserDefaults.standard.integer(forKey: "topStage")
        
        if topScene > 1 {
            statsАrray = UserDefaults.standard.array(forKey: "stat") as! [[Int]]
        }
        
        //topScene = 45
        
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
