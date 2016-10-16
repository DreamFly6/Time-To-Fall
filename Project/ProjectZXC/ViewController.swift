//
//  ViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 28.07.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import UIKit
import SpriteKit

public var thisScene = 0
public var topScene = 0
class ViewController: UIViewController {

    
    override func viewDidLoad() {
    var ert = 0
        while ert < 10{
            ert+=1

        }

    }
    

    @IBOutlet var theButton: UIButton?
    
    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        
        let buttonTitle : String = sender.currentTitle!!
        var sceneView = GameScene(fileNamed:"Level 1")
        thisScene = Int(buttonTitle)!
        sceneView = GameScene(fileNamed: "Level "+buttonTitle)
        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        sceneView!.scaleMode = .aspectFill
        skView.presentScene(sceneView)
    }
}
