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
        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)
        let scene = GameScene(fileNamed:"Level_1")
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene!.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    @IBOutlet weak var buttonLevel2: UIButton!
    
    @IBAction func buttonLevel2(sender: AnyObject) {
        
        let skView1 = SKView(frame: self.view.frame)
        self.view.addSubview(skView1)
        let scene1 = GameScene(fileNamed:"Level_2")
        skView1.showsFPS = true
        skView1.showsNodeCount = true
        skView1.ignoresSiblingOrder = true
        scene1!.scaleMode = .AspectFill
        skView1.presentScene(scene1)
    }

}
