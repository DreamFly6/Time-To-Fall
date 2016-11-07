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

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func `switch`(_ sender: AnyObject) {
        
        if mySwitch.isOn {
            statusBarBool = true
            print(statusBarBool)
        } else {
            statusBarBool = false
            print(statusBarBool)
        }
    
    }
    
    
}
