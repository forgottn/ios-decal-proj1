//
//  AddTaskViewController.swift
//  ToDoListApp
//
//  Created by Peter Duong on 10/7/15.
//  Copyright © 2015 Peter Duong. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIBarButtonItem!
    var task:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != self.addButton {
            return
        }
        
        task = self.textField.text
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
