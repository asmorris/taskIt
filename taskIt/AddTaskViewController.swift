//
//  AddTaskViewController.swift
//  taskIt
//
//  Created by Andrew Morrison on 2016-03-20.
//  Copyright © 2016 Andrew Morrison. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    
    
    @IBOutlet var addTaskTextField: UITextField!
    @IBOutlet var addSubtaskTextField: UITextField!
    @IBOutlet var addDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func cancelButtonPressed(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func addTaskButtonPressed(sender: UIButton) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        task.task = addTaskTextField.text
        task.subtask = addSubtaskTextField.text
        task.date = addDate.date
        task.completed = false
        
        appDelegate.saveContext()        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
