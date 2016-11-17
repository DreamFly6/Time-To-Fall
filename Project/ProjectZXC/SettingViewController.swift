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
public let qweewq = 1

class SettingViewController: UIViewController {
    
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

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func `switch`(_ sender: AnyObject) {
        
        if mySwitch.isOn {
            statusBarBool = true
            setTopScene(topStage: 1)
            UserDefaults.standard.removeObject(forKey: "stat")
            print(statusBarBool)
        } else {
            statusBarBool = false
            setTopScene(topStage: 30)
            print(statusBarBool)
        }



        
    
    }
    
    
}
