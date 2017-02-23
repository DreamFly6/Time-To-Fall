//
//  SkinViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 23.02.17.
//  Copyright © 2017 Женя. All rights reserved.
//

import Foundation
import UIKit

class SkinViewController: UITableViewController {
        
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableSkin: UITableView!
    
    override func viewDidLoad() {
        tableView.contentInset.top = 20
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return fruits.count
//    }
//    
//    // create a cell for each table view row
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
//        
//        let fruitName = fruits[indexPath.row]
//        cell.textLabel?.text = fruitName
//        cell.detailTextLabel?.text = "Delicious!"
//        cell.imageView?.image = UIImage(named: fruitName)
//        
//        return cell
//
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
