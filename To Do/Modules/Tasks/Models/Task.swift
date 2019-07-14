//
//  Task.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import Foundation

struct Task {
    var id: String?
    var title: String?
    var dateTime: String?
    var isDone: Bool = false
    
    mutating func setDateTime(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateTime = formatter.string(from: date)
    }
}
