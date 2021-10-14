//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  Comp 5970 - Dr. Chapman
//  ToDoList.swift
//  Prog4Lam0097SU21
//
//  Created by user197928 on 7/9/21.
//

import Foundation
import UIKit
import os.log

class ToDoList: NSObject, NSCoding {
    
    //MARK: Variables Functions: All Strings
    var task: String
    var describe: String
    var information: String
        
    //MARK: Decoder
    func encode(with aCoder: NSCoder) {
        aCoder.encode(task, forKey: PropertyKey.task)
        aCoder.encode(describe, forKey: PropertyKey.describe)
        aCoder.encode(information, forKey: PropertyKey.information)
    }
    
    //Decodes the task name. If it cannot be found then throws a failure.
    required convenience init?(coder aDecoder: NSCoder) {
        guard let task = aDecoder.decodeObject(forKey: PropertyKey.task) as? String else {
            os_log("Task is not able to be decoded", log: OSLog.default, type: .debug)
            return nil
        }
        
        let information = aDecoder.decodeObject(forKey: PropertyKey.information) as? String
        let describe = aDecoder.decodeObject(forKey: PropertyKey.describe) as? String

        self.init(task: task, information: information!, describe: describe!)
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("ToDoList")

   
    //MARK: Intialize the String values
    init?(task: String, information: String, describe: String) {
        
        if task.isEmpty {
            return nil
        }
        
        self.task = task
        self.information = information
        self.describe = describe

        
    }
    
    //MARK: Static Variables
    struct PropertyKey {
        static let task = "task"
        static let information = "information"
        static let describe = "description"
    }
}

