//
//  ViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 28.07.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import UIKit
import GameController
import SpriteKit

class ViewController: UIViewController {
    
    @IBAction func buttonTouch1(sender: AnyObject) {
        print("нажали на кнопку button2")
        let SecondScene = GameScene(fileNamed:"Level1")
        let transition = SKTransition.doorsCloseHorizontalWithDuration(0.5)
        SecondScene!.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(SecondScene!, transition: transition)
    }
    
    

}
