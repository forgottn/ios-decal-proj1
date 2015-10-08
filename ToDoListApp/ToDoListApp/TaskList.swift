//
//  Task.swift
//  ToDoListApp
//
//  Created by Peter Duong on 10/7/15.
//  Copyright © 2015 Peter Duong. All rights reserved.
//

import UIKit

struct Task {
    var item: String
    var complete: Bool
    var completedOn: NSDate
    
    init(item: String) {
        self.item = item
        self.complete = false
        self.completedOn = NSDate()
    }
}

class TaskList: NSObject {
    
    var tasks = [Task]()
    
    func addTask(taskItem: String?) {
        tasks.append(Task(item: taskItem!))
    }
    
    func filterCompleted() -> [Task] {
        let secondsInAnHour = 3600.00;
        tasks = tasks.filter({!$0.complete || (NSDate().timeIntervalSinceDate($0.completedOn) / secondsInAnHour) < 24.00})
        
        return tasks
    }
    
}
