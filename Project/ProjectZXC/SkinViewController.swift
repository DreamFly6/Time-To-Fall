//
//  SkinViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 23.02.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import UIKit

public var skinBoolArr = [true,false,true,false]
public var skinCondArr = [0,0,0,0]

class SkinViewController: UITableViewController {
    
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet weak var bar: UINavigationBar!
    @IBOutlet var tableSkin: UITableView!
    
    @IBOutlet weak var cell2: UILabel!
    
    @IBOutlet var cellSkin: [UITableViewCell]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset.top = 20
        let tempImageView = UIImageView(image: UIImage(named: "MenuBg1.png"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
        print(skinCondArr)
        
        cell2.text = String(skinCondArr[2]) + " / 100"
        
<<<<<<< HEAD
//        tableView.allowsSelection = false
=======
        
>>>>>>> origin/master
        tableView.backgroundColor = .clear
        
        
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
//        let  sizeArray = cellSkin.count
//        for index in 0...sizeArray {
        
        for index in 0...3 {
<<<<<<< HEAD
            // Тут нужно допилить
            if skinBoolArr[index] == true {
                cellSkin[index].isUserInteractionEnabled = false
=======
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .clear
            
            // Тут нужно допилить
            if skinBoolArr[index] == true {

>>>>>>> origin/master
            }
            if skinCondArr[0] == 1 {
                
            }
        }
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.isTranslucent = true
        cellSkin[indexCharacterTexture].accessoryType = .checkmark
        
    }
    
    
    
    // number of rows in table view
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return fruits.count
    //    }
    //
    // create a cell for each table view row
    
    
    
    
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        indexCharacterTexture = indexPath.row
        let cell = tableView.cellForRow(at: indexPath)
        
        for index in 0...4 {
            let indexPath = IndexPath(row: index, section: 0)
            let cellNone = tableView.cellForRow(at: indexPath)
            cellNone?.accessoryType = .none
        }

        cell?.accessoryType = .checkmark

    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath as IndexPath)!
        deselectedCell.backgroundColor = UIColor.clear
    }
}

