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
    
    //Сделал очень просто
    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        var scene1 = GameScene(fileNamed:"Level_1")
        let buttonTitle : String = sender.currentTitle!!
        
        switch buttonTitle {
        case "Level 1":
            scene1 = GameScene(fileNamed:"Level_1")
        case "Level 2":
            scene1 = GameScene(fileNamed:"Level_2")
        case "Level 3":
            scene1 = GameScene(fileNamed:"Level_3")
        case "Level 4":
            scene1 = GameScene(fileNamed:"Level_4")
        case "Level 5":
            scene1 = GameScene(fileNamed:"Level_5")
        default: break
        }
        
        let skView1 = SKView(frame: self.view.frame)
        self.view.addSubview(skView1)
        skView1.showsFPS = true
        skView1.showsNodeCount = true
        skView1.ignoresSiblingOrder = true
        scene1!.scaleMode = .aspectFill
        skView1.presentScene(scene1)

    }
    
    
    

}
