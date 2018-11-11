//
//  CompletedTaskViewController.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/19/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit
import CoreData

class CompletedTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CompletedData.completed.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath) as! CompletedCellTableViewCell
        
        let title = CompletedData.completed[indexPath.row].title
        
        let detail = CompletedData.completed [indexPath.row].detail
        
        cell.title.text = title
        cell.details.text = detail
        
        
        return cell
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         tableView.setNeedsLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.reloadData()
        self.tableView.reloadData()
        
    }
    
    
   

}
