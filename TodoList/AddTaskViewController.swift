//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/19/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    
    
    @IBOutlet weak var taskTitle: UITextField!
    
    
    @IBOutlet weak var taskDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonClicked(_ sender: Any) {
        
        let taskTitle = self.taskTitle.text!
        let taskDescription = self.taskDescription.text!
        self.save(taskTitle, taskDescription)
        
        
        
    }
    
    
    func save(_ title: String, _ detail: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "ListTask",
                                       in: managedContext)!
        
        let newTask = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        // 3
        newTask.setValue(title, forKeyPath: "title")
        newTask.setValue(detail, forKeyPath: "detail")
        
        
        
        // 4
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
}
