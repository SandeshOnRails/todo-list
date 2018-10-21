//
//  TasksViewController.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/18/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var tasks:[TaskLists] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadData()
        

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        self.tableView.backgroundColor = UIColor.green


        tableView.reloadData()
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tasks.count;
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentTask = self.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath) as! TaskViewCell
        cell.taskTitle.text! = currentTask.title
        cell.taskDetail.text! = currentTask.detail
        //cell.backgroundColor = UIColor.yellow

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
            NSFetchRequest<NSManagedObject>(entityName: "ListTask")
        
        do {
           let  taskManagedObj = try managedContext.fetch(fetchRequest)
            setTask(taskManagedObj)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
 
 */
    
    
    func setTask(_ managedObj: [NSManagedObject]) {
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            let taskDescription = task.value(forKeyPath: "detail") as! String
           let newTask = TaskLists(taskTitle,taskDescription)
           self.tasks.append(newTask)
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let id = segue.identifier;
        
        if id == "detailSegue" {
            
            let from = sender as AnyObject
            
            let cell = from.superview?.superview as! TaskViewCell
            
            let detailView = segue.destination as! TaskDetailViewController
            detailView.titleName = cell.taskTitle.text!
            detailView.detailName = cell.taskDetail.text!
            
        
            
        }
        
        if id == "editSegue" {
            
            let from = sender as AnyObject
            
            let cell = from.superview?.superview as! TaskViewCell
            
            let toUpdate = cell.taskTitle.text!
            
            let detailView = segue.destination as! EditTaskViewController
            
            detailView.editTitle = cell.taskTitle.text!
            detailView.editDetail = cell.taskDetail.text!
            
            
        }
 
        
       
        
    }
    
    
    
    
  
    @IBAction func taskCompleteButtonClicked(_ sender: Any) {
        
        
        
        let from = sender as AnyObject
        
        let cell = from.superview?.superview as! TaskViewCell
        
        let indexPath = tableView.indexPath(for:cell)
        
        let indexToRemove = indexPath?.row
        
        let titleName = cell.taskTitle.text!
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "ListTask")
        
        do {
            let  taskManagedObj = try managedContext.fetch(fetchRequest)
            
            for obj in taskManagedObj {
                
                let taskTitle = obj.value(forKeyPath: "title") as! String
                if tasks[indexToRemove!].title == taskTitle {
                     managedContext.delete(obj)
                }
            }
            
            do {
               try managedContext.save()
                tasks.remove(at:indexToRemove!)
                self.save(cell.taskTitle.text!, cell.taskDetail.text!)
                self.tableView.reloadData()


                
            }
            
            catch {
                print (error)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        

    }
    
    
    
    
    
    @IBAction func editTaskClicked(_ sender: Any) {
        
        
        
    }
    
    func save(_ title: String, _ detail: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Completed",
                                       in: managedContext)!
        
        let newTask = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        
        newTask.setValue(title, forKeyPath: "title")
        newTask.setValue(detail, forKeyPath: "detail")
        
        
        
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func loadData() {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "ListTask")
        
        do {
            let  taskManagedObj = try managedContext.fetch(fetchRequest)
            setTask(taskManagedObj)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    func deleteThatShit() {
        
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
            
            for obj in taskManagedObj {
                
               
                managedContext.delete(obj)
            }
            
            do {
                try managedContext.save()
                
            }
                
            catch {
                print (error)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
 
}
