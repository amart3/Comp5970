//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  Comp 5970 - Dr. Chapman
//
//  ViewController.swift
//  FinalProgLam0097SU21
//
//  Created by user197928 on 7/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    //Label controls.
    //Shows calculator input for equation.
    //Shows calculator resulting output from equation.
    @IBOutlet weak var calculatorWork: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var work: String = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    //Clear func.
    //Clears the calculator
    //Blank Screen initialized when prompted.
    func clearAll() {
        work = ""
        calculatorWork.text = ""
        calculatorResult.text = ""
    }
    
    
    
    @IBAction func clearAllButton(_ sender: Any) {
        clearAll()
    }
    
    //Deletes data from the input when there is data present.
    @IBAction func deleteButton(_ sender: Any) {
        if(!work.isEmpty) {
            work.removeLast()
            calculatorWork.text = work
        }
    }
    
    //String value initializes data to be added from pressed buttons.
    func addToWork(value: String){
        work = work + value
        calculatorWork.text = work
    }
    
    //Converts in format of decimal
    //User can interpret as percent.
    //50 -> 0.5
    @IBAction func percentButton(_ sender: Any) {
        addToWork(value: "%")
    }
    
    //Simple division functionality
    @IBAction func divButton(_ sender: Any) {
        addToWork(value: "/")
    }
    
    //Simple multiplication functionality
    @IBAction func multButton(_ sender: Any) {
        addToWork(value: "*")
    }
    
    //Simple subtraction functionality
    @IBAction func subButton(_ sender: Any) {
        addToWork(value: "-")
    }
    
    //Simple addition functionality
    @IBAction func addButton(_ sender: Any) {
        addToWork(value: "+")
    }
    
    
    //initializes the string data in the calculatorWork.
    //calculatorWork.text data is prompted
    //solves for calculatorResult.text
    @IBAction func equalsButton(_ sender: Any) {
        if correctInput() {
        let checkedWorkForPercent = work.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calculatorResult.text = resultString
        }
        else {
            let alert = UIAlertController(title: "Invalid Input",
                message: "Calculator is not able to complete this equation.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    //Function initializes commands for Validation
    func correctInput() -> Bool {
        var count  = 0
        var funcCharIndexes = [Int]()
        
        for char in work {
            if (specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes{
            if (index == 0) {
                return false
            }
            if (index == work.count - 1) {
                return false
            }
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    //Commmands for special character keys.
    //Prevents Special Characters from being initialized equation by themselves.
    //Calls non-validated tab if only operand inside.
    func specialCharacter(char: Character) -> Bool {
        if(char  == "*") {
            return true
        }
        
        if(char  == "+") {
            return true
        }
        
        if(char  == "/") {
            return true
        }
        /**
        if (char == "%") {
            return true
        }
        */
        return false
    }
    
    //Returns Function as a remainder
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    
    //Decimal Initializer
    @IBAction func decimalButton(_ sender: Any) {
        addToWork(value: ".")
    }
    
    //Numerical Button Initializer
    //Initializes buttons with numerical values
    //1-10
    @IBAction func zeroButton(_ sender: Any) {
        addToWork(value: "0")
    }
    
    
    @IBAction func oneButton(_ sender: Any) {
        addToWork(value: "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        addToWork(value: "2")
    }
    
    
    @IBAction func threeButton(_ sender: Any) {
        addToWork(value: "3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        addToWork(value: "4")
    }
    
    
    @IBAction func fiveButton(_ sender: Any) {
        addToWork(value: "5")
    }
    
    
    @IBAction func sixButton(_ sender: Any) {
        addToWork(value: "6")
    }
    
    
    @IBAction func sevenButton(_ sender: Any) {
        addToWork(value: "7")
    }
    
    
    @IBAction func eightButton(_ sender: Any) {
        addToWork(value: "8")
    }
    
    
    @IBAction func nineButton(_ sender: Any) {
        addToWork(value: "9")
    }
    
    
    
}

