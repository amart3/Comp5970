//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  Comp 5970 - Dr. Chapman
//  ToDoTableViewCell.swift
//  Prog3Lam0097SU21
//
//  Created by user197928 on 7/9/21.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    //Allow task cell to implement on multiple controllers.
    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
