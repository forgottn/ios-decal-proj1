//
//  DailyStatsViewController.swift
//  ToDoListApp
//
//  Created by Peter Duong on 10/8/15.
//  Copyright © 2015 Peter Duong. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {
    
    var taskList: TaskList!
    @IBOutlet var completedTaskCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        completedTaskCounter.text = countCompletedTasksWithinPast24Hours()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countCompletedTasksWithinPast24Hours() -> String {
        var numberOfCompletedTasks = 0
        for task in taskList.tasks {
            if task.complete {
                numberOfCompletedTasks += 1
            }
        }
        return String(numberOfCompletedTasks)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
