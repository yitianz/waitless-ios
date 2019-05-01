//
//  ViewController.swift
//  Dynamo
//
//  Created by Yitian Zou on 4/18/19.
//  Copyright © 2019 Yitian Zou. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var phone: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        phoneNumber.delegate = self
        
        boxView.layer.cornerRadius = 15
        boxView.layer.masksToBounds = true
        
        nextButton.layer.cornerRadius = 5
        nextButton.layer.masksToBounds = true
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        phone = textField.text!
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MachineViewController
        {
            let vc = segue.destination as? MachineViewController
            vc?.phone = phone
        }
    }
    
}

