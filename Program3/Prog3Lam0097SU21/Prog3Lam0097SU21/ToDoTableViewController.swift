//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  Comp 5970 - Dr. Chapman
//  ToDoTableViewController.swift
//  Prog3Lam0097SU21
//
//  Created by user197928 on 7/9/21.
//

import UIKit
import os.log
class ToDoTableViewController: UITableViewController {
    var list = [ToDoList]()
    
    //MARK: UnwindToDo Function
    @IBAction func unwindToDoList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ToDoViewController, let toDoList = sourceViewController.toDoList {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
               
                list[selectedIndexPath.row] = toDoList
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
              
                let newIndexPath = IndexPath(row: list.count, section: 0)
                
                list.append(toDoList)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }

            saveList()
        }
    }
    
    // MARK: Private Methods
    private func loadPreslist() {

        //Preset conditions for the Task list
        guard let toDoList1 = ToDoList(task: "Get Groceries", information: "Leave at 10 a.m.", describe: "Buy 5 Apples") else {
            fatalError("Cannot Find toDoList1")
        }
        guard let toDoList2 = ToDoList(task: "Go to Old Navy", information: "Leave at 12 p.m.", describe: "Buy 3 pairs of shirts") else {
            fatalError("Cannot Find toDoList2")
        }
        guard let toDoList3 = ToDoList(task: "Go to the Gym", information: "Leave at 8 a.m.", describe: "Bench press, crunches, Squats") else {
            fatalError("Cannot Find toDoList3")
        }
        guard let toDoList4 = ToDoList(task: "Finish Assignmenet", information: "Work on discrete Structures.", describe: "Cahpter 1 Homework") else {
            fatalError("Cannot Find toDoList4")
        }
        guard let toDoList5 = ToDoList(task: "Wash my car", information: "But more soap", describe: "Vacuum the inside") else {
            fatalError("Cannot Find toDoList5")
        }
        guard let toDoList6 = ToDoList(task: "Go to Best Buy", information: "Replace my keyboard", describe: "Find a keyboard that has a Num Lock") else {
            fatalError("Cannot Find toDoList6")
        }
        guard let toDoList7 = ToDoList(task: "Go get lunch", information: "Go to the cafeteria.", describe: "Try to eat healthy :)") else {
            fatalError("Cannot Find toDoList7")
        }
        
        list += [toDoList1, toDoList2, toDoList3, toDoList4, toDoList5, toDoList6, toDoList7]
    }
    
    //Save Functionality/ Archives data from the Save function
    private func saveList() {
        let saveWorks = NSKeyedArchiver.archiveRootObject(list, toFile: ToDoList.ArchiveURL.path)
        if saveWorks {
            os_log("List has saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("List was not able to save :(", log: OSLog.default, type: .error)
        }
    }
    
    private func listLoaded() -> [ToDoList]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ToDoList.ArchiveURL.path) as? [ToDoList]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        
        if let listSaved = listLoaded() {
            list += listSaved
        }
        else {
            // Load the sample data.
            loadPreslist()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View Functionality

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    //Calls tableView rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return list.count
    }
    
    //Override to pull ToDoTableViewCell data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentity =  "ToDoTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity, for: indexPath) as! ToDoTableViewCell
        
        let listToDo = list[indexPath.row]
        
        cell.taskLabel.text = listToDo.task
        
        return cell
    }

    // Conditional Override
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // override allows for editing Table View
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            list.remove(at: indexPath.row)
            saveList()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    //Reorder function
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = list[sourceIndexPath.row]
        list.remove(at: sourceIndexPath.row)
        list.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
         
        //Add button functionality
        case "addFunction":
            os_log("Adding new Item.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let toDoDetailViewController = segue.destination as? ToDoViewController else {
                fatalError("Bad destination: \(segue.destination)")
            }
            
            guard let toDoCell = sender as? ToDoTableViewCell else {
                fatalError("Bad sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: toDoCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let usedToDo = list[indexPath.row]
            toDoDetailViewController.toDoList = usedToDo
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
}
