//
//  EditGameRecordCell.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 06/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class EditGameRecordCell: UITableViewCell {
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var goalCount: UILabel!
    @IBOutlet weak var playerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onStepperChanged(_ sender: UIStepper) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
