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



class SettingViewController: UIViewController {
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func `switch`(_ sender: AnyObject) {
        
        if mySwitch.isOn {
            print("UISwitch is ON")
        } else {
            print("UISwitch is OFF")
        }
    
    }
    
    
}
