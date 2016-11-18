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

class SettingViewController: UIViewController {
    
    //@IBOutlet weak var Stat: UITextView!
    
    @IBOutlet weak var Stat: UITextView!
    override func viewDidLoad() {
        var text = ""
        for i in 0...63 {
            text = text + "=========" + String(i) + "=========" + "\n"
            text = text + "Next    - " + String(statsАrray[i][0]) + "   //Нажатие на кнопку next" + "\n"
            text = text + "Retry   - " + String(statsАrray[i][1]) + "   //Нажатие на кнопку retry" + "\n"
            text = text + "Lose    - " + String(statsАrray[i][2]) + "   //Проигрыши" + "\n"
            text = text + "Destroy - " + String(statsАrray[i][3]) + "   //Кол-во разрушенных блоков" + "\n"
            text = text + "Time    - " + String(statsАrray[i][4]) + "   //Время на каждом уровне (время=кол-во фреймов)" + "\n"
        }
        Stat.text = text
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

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func `switch`(_ sender: AnyObject) {
        
        if mySwitch.isOn {
            statusBarBool = true
            UserDefaults.standard.removeObject(forKey: "stat")
            setTopScene(topStage: 1)
            topScene = 1
            print("Топ сцена 1 + stat удален")
        }
        else {
            statusBarBool = false
        }



        
    
    }
    
    
}
