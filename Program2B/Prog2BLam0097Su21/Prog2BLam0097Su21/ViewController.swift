//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  ViewController.swift
//
//  Prog2BLam0097Su21 - 6/18/2021
//  Comp 5970 - Dr. Chapman
//  Created by user197928 on 6/13/21.

import UIKit

class ViewController: UIViewController {
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.text = ""
        
    }
    
    //Text Fields and imageView
    @IBOutlet weak var principle: UITextField!
    @IBOutlet weak var paymentAmnts: UITextField!
    @IBOutlet weak var interestRate: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    /**
     *Button field
     *Links the textfields together to calculate the payment formula
     *interestRate, principle, anf paymentAmnts textFields prompt User entry
     *Result textfield solves for prompted entries.
     */
    @IBAction func calculate(_ sender: UIButton) {
        if paymentAmnts.text == "" || principle.text == "" || interestRate.text == "" {
                 result.text = "ERROR!"
                 return
             }
             
             let payments = Int(paymentAmnts.text!)!
             let intRate = Float(interestRate.text!)!
             let principleFunc = Float(principle.text!)!
             
             let resultFromCalc = paymentCalc(payments, intRate, principleFunc)
             
             result.text = "$ " + resultFromCalc
         }
       
    // Function for loan Calculator
    // If monthly payment user should pre-divide exp. 0.044/12
    func paymentCalc(_ time: Int, _ interestRate: Float, _ loanAmnt: Float)-> String {
        var payment = 0.0
        
        payment = Double((Float(loanAmnt) * interestRate) / (1.0 - pow((1.0 + interestRate), Float(-time))))
        
        let f = Float((round(100*payment)/100))
        return String(format: "%.2f", f)

    }
    
    // Sets Device Orientation
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
         return UIInterfaceOrientationMask(rawValue: (UIInterfaceOrientationMask.portrait.rawValue | UIInterfaceOrientationMask.landscapeLeft.rawValue | UIInterfaceOrientationMask.landscapeRight.rawValue))
     }
}

