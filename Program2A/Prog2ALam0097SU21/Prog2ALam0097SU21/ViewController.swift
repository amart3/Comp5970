//  Lawrence "Alex" Martin
//  Lam0097 - 903986867
//  ViewController.swift
//  Prog2ALam0097SU21 - 6/15/2021
//  Comp 5970 - Dr. Chapman
//  Created by user197928 on 6/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func auburnButton(_ sender: UIButton) {
        imageView.image = UIImage(named:
            "auburnLogo")
    }
    
    @IBAction func secButton(_ sender: UIButton) {
        imageView.image = UIImage(named:
            "secLogo") 
    }
    
    
    @IBAction func alabamaButton(_ sender: UIButton) {
        imageView.image = UIImage(named:
            "alabamaLogo")
    }
}

