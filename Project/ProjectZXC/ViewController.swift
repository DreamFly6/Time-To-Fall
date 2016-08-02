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
    
    @IBAction func buttonTouch1(sender: AnyObject) {
        
        var newGameScene: GameScene = GameScene(size: self.size)
        
        let transition = SKTransition.revealWithDirection(.Down, duration: 1.0)
        
        let nextScene = GameScene(size: scene!.size)
        nextScene.scaleMode = .AspectFill
        
        scene?.view?.presentScene(nextScene, transition: transition)
    
    }
    
    

}
