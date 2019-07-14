//
//  PreviewTasksViewController.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit

class PreviewTasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(tasksUpdated(_:)), name: .didReceiveToDoTasks, object: nil)
        TasksHandler.shared.fetchTasks()
    }

    @objc func tasksUpdated(_ notification: Notification) {
        tableView.reloadData()
    }
}


extension PreviewTasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TasksHandler.shared.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let task = TasksHandler.shared.tasks[indexPath.row]
        cell.setup(task: task)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TasksHandler.shared.tasks[indexPath.row]
            TasksHandler.shared.deleteTask(task: task)
        }
    }
}


extension PreviewTasksViewController: TaskTableViewCellDelegate {
    func taskCheckBoxStateChanged(task: Task) {
        TasksHandler.shared.updateTask(task: task)
    }
}
