//
//  TasksHandler.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import Foundation
import Firebase

class TasksHandler {

    static let shared = TasksHandler()
    
    var tasks = [Task]()
    private var refTasks: DatabaseReference!
    
    
    private init() {
        refTasks = Database.database().reference().child("tasks")
    }
    
    func insertTask(task: Task) {
        if let key = refTasks.childByAutoId().key {
            let task = ["id": key,
                        "title": task.title!,
                        "date_time": task.dateTime!,
                        "is_done": task.isDone
                ] as [String : Any?]
            refTasks.child(key).setValue(task)
        }
    }
    
    func fetchTasks() {
        //observing the data changes
        refTasks.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                self.tasks = []
                
                for tasksDic in snapshot.children.allObjects as! [DataSnapshot] {
                    let taskObject = tasksDic.value as? [String: AnyObject]
                    let taskId  = taskObject?["id"]
                    let title  = taskObject?["title"]
                    let dateTime = taskObject?["date_time"]
                    let isDone = taskObject?["is_done"]
                    
                    let task = Task(id: taskId as! String?, title: title as! String?, dateTime: dateTime as! String?, isDone: isDone as! Bool)
                    self.tasks.append(task)
                }
                
                NotificationCenter.default.post(name: .didReceiveToDoTasks, object: nil)
            }
        })
    }
    
    func deleteTask(task: Task) {
        if let key = task.id {
            refTasks.child(key).removeValue()
        }
    }
}
