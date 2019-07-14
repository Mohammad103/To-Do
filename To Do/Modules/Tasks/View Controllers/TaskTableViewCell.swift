//
//  TaskTableViewCell.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit
import M13Checkbox

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: M13Checkbox!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!

}
