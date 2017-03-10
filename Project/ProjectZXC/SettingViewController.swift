//
//  SettingViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 07.11.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

public var statusBarBool = false
public var showFPS = false


class SettingViewController: UIViewController {
    
    //@IBOutlet weak var Stat: UITextView!
    
    @IBOutlet weak var switchShowFPS: UISwitch!
    
    override func viewDidLoad() {
        if showFPS == true {
            switchShowFPS.setOn(true, animated: true)
        }
        else {
            switchShowFPS.setOn(false, animated: false)
        }
    }
    
    @IBAction func test(_ sender: UISwitch) {
        if(switchShowFPS.isOn) {
            showFPS = true
        }
        else {
            showFPS = false
        }

    }

    //Сохранение топовой сцены
    func setTopScene(topStage: Int) {
        UserDefaults.standard.set(topStage, forKey: "topStage")
        UserDefaults.standard.synchronize()
        
        print("=======================")
        print("=======================")
        print("=======================")
        print("Был сохранен " + String(topStage))
        print("=======================")
        print("Текущий topScene " + String(topScene))
        print("=======================")
        print("=======================")
        print("=======================")
        
    }

}
