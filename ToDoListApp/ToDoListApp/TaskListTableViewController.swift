//
//  TaskListTableViewController.swift
//  ToDoListApp
//
//  Created by Peter Duong on 10/7/15.
//  Copyright © 2015 Peter Duong. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    var taskList: TaskList = TaskList()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        taskList.tasks = taskList.filterCompleted()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let task: Task = taskList.tasks[indexPath.row] as Task
        cell.textLabel?.text = task.item
        if task.complete {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var tappedTask: Task = taskList.tasks[indexPath.row] as Task
        tappedTask.complete = !tappedTask.complete
        if tappedTask.complete {
            tappedTask.completedOn = NSDate()
        }
        taskList.tasks[indexPath.row] = tappedTask
        tableView.reloadData()
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            taskList.tasks.removeAtIndex(indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "dailyStats") {
            let dailyStatsViewController = segue.destinationViewController as! DailyStatsViewController
            dailyStatsViewController.taskList = taskList
        }
    }
    
    @IBAction func unwindToTaskList(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func addToTaskList(segue: UIStoryboardSegue) {
        if let addTaskViewController = segue.sourceViewController as? AddTaskViewController {
            taskList.addTask(addTaskViewController.task)
            tableView.reloadData()
        }
    }

}
