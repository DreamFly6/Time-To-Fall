//
//  SkinViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 23.02.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import UIKit

public var skinBoolArr = Array(repeating: false, count: 300)
public var skinCondArr = Array(repeating: 0, count: 300)
public var indexCharacterTexture = 0


class SkinViewController: UITableViewController {
    
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet weak var bar: UINavigationBar!
    @IBOutlet var tableSkin: UITableView!
    

    
    @IBOutlet var cellSkin: [UITableViewCell]!
    @IBOutlet var labelSkin: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset.top = 20
        let tempImageView = UIImageView(image: UIImage(named: "MenuBg1.png"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
        print(skinCondArr)
        
        skinBoolArr[0] = true
        
        labelSkin[0].text = "Default character"
        labelSkin[1].text = "First 4 lvl on Gold medal"
        labelSkin[2].text = "Destroy " + String(skinCondArr[2]) + "/500 blocks"
        labelSkin[3].text = "Destroy " + String(skinCondArr[3]) + "/1500 blocks"
        labelSkin[4].text = "Destroy " + String(skinCondArr[4]) + "/250 Slime blocks"
        labelSkin[5].text = "Level 17,23,25 on Gold medal"
        tableView.backgroundColor = .clear
        
        
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        for index in 0...cellSkin.count-1 {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .clear
            cell?.tintColor = UIColor.white
            // Тут нужно допилить
            if skinBoolArr[index] == false {
                cellSkin[index].isUserInteractionEnabled = false
                cellSkin[index].backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5987338362)
            }
        }
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.isTranslucent = true
        cellSkin[indexCharacterTexture].accessoryType = .checkmark
        cellSkin[indexCharacterTexture].tintColor = UIColor.white
    }
    
    
    
    // number of rows in table view
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return fruits.count
    //    }
    //
    // create a cell for each table view row
    
    
    
    
    
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        indexCharacterTexture = indexPath.row
        UserDefaults.standard.set(indexCharacterTexture, forKey: "indexCharacterTexture")
        UserDefaults.standard.synchronize()
        
        let cell = tableView.cellForRow(at: indexPath)
        
        for index in 0...cellSkin.count-1 {
            let indexPath = IndexPath(row: index, section: 0)
            let cellNone = tableView.cellForRow(at: indexPath)
            cellNone?.accessoryType = .none
        }

        cell?.tintColor = UIColor.white
        cell?.accessoryType = .checkmark

    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath as IndexPath)!
        deselectedCell.backgroundColor = UIColor.clear
    }
}

