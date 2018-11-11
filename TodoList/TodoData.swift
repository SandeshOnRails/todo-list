//
//  TodoData.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/24/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TodoData {
    
    static var todo:[TaskLists] = []
    
    init() {
        
    }
    
    static func fetchData() {
        
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
            setCompletedTask(taskManagedObj)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    static  func setCompletedTask(_ managedObj: [NSManagedObject]) {
        
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            let taskDescription = task.value(forKeyPath: "detail") as! String
            let newTask = TaskLists(taskTitle,taskDescription)
            TodoData.todo.append(newTask)
        }
        
        
    }
    
    
}
