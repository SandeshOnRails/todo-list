//
//  TaskViewCell.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/18/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {
    
    @IBOutlet weak var taskTitle: UILabel!
    
    
    @IBOutlet weak var taskDetail: UILabel!
    
    
    @IBOutlet weak var completedButton: UIButton!
    
    
    
    @IBOutlet weak var seeDetailsButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
