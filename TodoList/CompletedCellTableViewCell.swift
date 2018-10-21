//
//  CompletedCellTableViewCell.swift
//  TodoList
//
//  Created by Sandesh Basnet on 10/20/18.
//  Copyright © 2018 Sandesh Basnet. All rights reserved.
//

import UIKit

class CompletedCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    

    @IBOutlet weak var details: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
