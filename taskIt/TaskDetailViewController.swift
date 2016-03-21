//
//  TaskDetailViewController.swift
//  taskIt
//
//  Created by Andrew Morrison on 2016-03-20.
//  Copyright © 2016 Andrew Morrison. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var detailTaskModel:TaskModel!
    
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var subtaskTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        appDel.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
