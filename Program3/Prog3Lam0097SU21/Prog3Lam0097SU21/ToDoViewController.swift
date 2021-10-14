//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  Comp 5970 - Dr. Chapman

//  ToDoViewController.swift
//  Prog3Lam0097SU21
//
//  Created by user197928 on 7/9/21.
//

import UIKit
import os.log

class ToDoViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    //MARK: - IBAOutlet Functions
    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var infoLabel: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    //MARK: -IBA Action Functions
    @IBAction func cancellButton(_ sender: UIBarButtonItem) {
        let isPresentingInToDoMode = presentingViewController is UINavigationController
        
        if isPresentingInToDoMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("ToDoViewController cannot be accessed through Navigation.")
        }
    }
    //MARK: View Controller Functionality
    //Story board Segue Control initiated by Bar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //Save button initializer must be pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("Save Button was not activated. Request Cancelled", log: OSLog.default, type: .debug)
            return
        }
        
        let task = taskLabel.text
        let describe = descriptionLabel.text ?? ""
        let information = infoLabel.text ?? ""
        
        toDoList = ToDoList(task: task!, information: information, describe: describe)
    }
    
    
    
    var toDoList: ToDoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskLabel.delegate = self
        if let toDoList = toDoList {
            navigationItem.title = toDoList.task
            taskLabel.text = toDoList.task
            descriptionLabel.text = toDoList.describe
            infoLabel.text = toDoList.information
        }
        
        syncSaveButton()

    }
    
    //MARK: Private Function
    private func syncSaveButton() {
        let text = taskLabel.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        syncSaveButton()
    }


}
