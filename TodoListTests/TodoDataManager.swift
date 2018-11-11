//
//  TodoDataManager.swift
//  TodoListTests
//
//  Created by Sandesh Basnet on 10/24/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import Foundation

import UIKit
import CoreData
@testable import TodoList




class TodoListManager {
    
    var completed:[TaskLists] = []
    
    var todo:[TaskLists] = []
    
    init() {
        
        self.fetchData()
        self.fetchTodo()
    }
    
     func fetchData() {
        
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
    
    func fetchTodo () {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "ListTask")
        
        do {
            let  taskManagedObj = try managedContext.fetch(fetchRequest)
            setTodoTask(taskManagedObj)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    func setTodoTask(_ managedObj: [NSManagedObject]) {
        
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            let taskDescription = task.value(forKeyPath: "detail") as! String
            let newTask = TaskLists(taskTitle,taskDescription)
            todo.append(newTask)
        }
        
        
    }
    
      func setCompletedTask(_ managedObj: [NSManagedObject]) {
        
        
        for task in managedObj {
            
            let taskTitle = task.value(forKeyPath: "title") as! String
            let taskDescription = task.value(forKeyPath: "detail") as! String
            let newTask = TaskLists(taskTitle,taskDescription)
            completed.append(newTask)
        }
        
        
    }
    
    func getList () -> [TaskLists] {
        
        return self.completed
    }
    
    func getTodo() -> [TaskLists] {
        
        return self.todo
    }
    


}
