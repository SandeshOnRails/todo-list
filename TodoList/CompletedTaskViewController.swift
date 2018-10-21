//
//  CompletedTaskViewController.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/19/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit
import CoreData

class CompletedTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var completedTasks:[TaskLists] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromDatabase()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.completedTasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath) as! CompletedCellTableViewCell
        
        let title = self.completedTasks[indexPath.row].title
        
        let detail = self.completedTasks[indexPath.row].detail
        
        cell.title.text = title
        cell.details.text = detail
        
        
        return cell
        
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
 */
    
    
    
    func setCompletedTask(_ managedObj: [NSManagedObject]) {
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            let taskDescription = task.value(forKeyPath: "detail") as! String
            let newTask = TaskLists(taskTitle,taskDescription)
            self.completedTasks.append(newTask)
        }
        
        
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
    

}
