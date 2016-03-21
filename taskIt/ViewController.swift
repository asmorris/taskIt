//
//  ViewController.swift
//  taskIt
//
//  Created by Andrew Morrison on 2016-03-19.
//  Copyright © 2016 Andrew Morrison. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet var tableView: UITableView!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchedResultsController = getFetchResultsController()
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController.sections![section].numberOfObjects
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let taskDict = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
        
        let cell:CellTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CellTableViewCell
        
        cell.taskLabel.text = taskDict.task
        cell.subTaskLabel.text = taskDict.subtask
        cell.dateLabel.text = Date.toString(taskDict.date!)
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        performSegueWithIdentifier("showTaskDetailController", sender: self)

    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "To Do"
        } else {
            return "Completed"
        }
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
        
        if indexPath.section == 0 {
        
            thisTask.completed = true
        } else {
            
            thisTask.completed = false
            
        }
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
    }
    
    //MARK: - NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    //MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetailController" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let thisTask = fetchedResultsController.objectAtIndexPath(indexPath!) as! TaskModel
            detailVC.detailTaskModel = thisTask
            
        } else if segue.identifier == "showAddTaskController" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            
        }
        
    }
    
    
    //IBActions
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        
        self.performSegueWithIdentifier("showAddTaskController", sender: self)
        
    }
    
    
    //Helper functions
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        
        fetchRequest.sortDescriptors = [completedDescriptor ,sortDescriptor]
        
        return fetchRequest
    }
    
    func getFetchResultsController() -> NSFetchedResultsController {
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        return fetchedResultsController
        
    }
    
    

}

