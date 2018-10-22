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
    
    var completedTasks:[TaskLists] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
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
    
    func setCompletedTask(_ managedObj: [NSManagedObject]) {
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            let taskDescription = task.value(forKeyPath: "detail") as! String
            let newTask = TaskLists(taskTitle,taskDescription)
            CompletedData.completed.append(newTask)
        }
   
       self.tableView.reloadData()
    
    }
 
   
    
    
    func loadFromDatabase() {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Completed")
        
        do {
            let  taskManagedObj = try managedContext.fetch(fetchRequest)
             setCompletedTask(taskManagedObj)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }

}
