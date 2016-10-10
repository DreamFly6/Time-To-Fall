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
   
    @IBAction func buttonLevel(_ sender: AnyObject) {
        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)
        let scene = GameScene(fileNamed:"Test_Level")
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene!.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    @IBOutlet weak var buttonLevel2: UIButton!
    
    @IBAction func buttonLevel2(_ sender: AnyObject) {
        
        let skView1 = SKView(frame: self.view.frame)
        self.view.addSubview(skView1)
        let scene1 = GameScene(fileNamed:"Level_2")
        skView1.showsFPS = true
        skView1.showsNodeCount = true
        skView1.ignoresSiblingOrder = true
        scene1!.scaleMode = .aspectFill
        skView1.presentScene(scene1)
    }

}
