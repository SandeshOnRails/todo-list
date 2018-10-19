//
//  TaskDetailViewController.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/18/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTaskTitle: UILabel!
    
    
    @IBOutlet weak var detailDescription: UILabel!
    
    var titleName: String!
    
    var detailName: String!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailTaskTitle.text = titleName
        detailDescription.text = detailName

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
