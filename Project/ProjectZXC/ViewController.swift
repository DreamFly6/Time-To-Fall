//
//  ViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 28.07.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonLevel: UIButton!
   
    @IBAction func buttonLevel(sender: AnyObject) {
        
            let SecondScene = GameScene(fileNamed:"Level_1")
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            SecondScene!.scaleMode = .AspectFill
            
            skView.presentScene(SecondScene)
            skView.showsPhysics = true
    }
    
    

}
