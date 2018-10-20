//
//  EditTaskViewController.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/19/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit
import CoreData

class EditTaskViewController: UIViewController {
    
    
    @IBOutlet weak var titleToEdit: UITextField!
    
    
    @IBOutlet weak var detailToEdit: UITextField!
    
    var editTitle:String!
    
    var editDetail:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleToEdit.text = editTitle
        detailToEdit.text = editDetail
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    @IBAction func editingDoneButtonClicked(_ sender: Any) {
        
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
                if taskTitle == self.editTitle {
                    obj.setValue(self.titleToEdit.text, forKey:"title")
                    obj.setValue(self.detailToEdit.text, forKey: "detail")
                }
                
                
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
