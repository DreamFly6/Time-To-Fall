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

    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        let buttonTitle : String = sender.currentTitle!!
        var sceneView = GameScene(fileNamed:"Test_Level")
        thisScene = Int(buttonTitle)!
        
        var ert = 0
        while ert < 10{
            ert+=1
            //if sender.currentTitle == String(ert){
                if let disableMyButton = sender as? UIButton{
                    print(disableMyButton.currentTitle," <------------------ Кнопка")
                    disableMyButton.setTitle("Жопа", for: .normal)
                }
            //}
        }






        //sceneView = GameScene(fileNamed: "Level "+buttonTitle)
        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        sceneView!.scaleMode = .aspectFill
        skView.presentScene(sceneView)
    }
}
