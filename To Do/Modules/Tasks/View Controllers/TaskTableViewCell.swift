//
//  TaskTableViewCell.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit
import M13Checkbox

protocol TaskTableViewCellDelegate: class {
    func taskCheckBoxStateChanged(task: Task)
}


class TaskTableViewCell: UITableViewCell {
    
    weak var delegate: TaskTableViewCellDelegate?
    private var task = Task()
    
    @IBOutlet weak var checkBox: M13Checkbox!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!

    
    override func prepareForReuse() {
        checkBox.checkState = .unchecked
    }
    
    func setup(task: Task) {
        self.task = task
        
        titleLabel.text = task.title
        dateTimeLabel.text = task.dateTime
        checkBox.stateChangeAnimation = .bounce(.fill)
        
        if task.isDone {
            checkBox.checkState = .checked
        }
    }
    
    @IBAction func checkboxValueChanged(_ sender: M13Checkbox) {
        if sender.checkState == .checked {
            task.isDone = true
        } else {
            task.isDone = false
        }
        delegate?.taskCheckBoxStateChanged(task: task)
    }
}
