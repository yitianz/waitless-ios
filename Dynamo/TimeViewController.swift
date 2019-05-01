//
//  TimeViewController.swift
//  Dynamo
//
//  Created by Yitian Zou on 4/21/19.
//  Copyright © 2019 Yitian Zou. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var nowBox: UIButton!
    @IBOutlet weak var in30Box: UIButton!
    @IBOutlet weak var in1hourBox: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var machineLabel: UILabel!
    
    var phone: String?
    var machine: String?
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let boxes = [nowBox, in30Box, in1hourBox]
        for box in boxes {
            box!.layer.cornerRadius = 10
            box!.layer.masksToBounds = true
        }
        
        backButton.layer.cornerRadius = 5
        backButton.layer.masksToBounds = true

        machineLabel.text = machine!
    }
    
    // MARK: Actions
    @IBAction func selectNow(_ sender: UIButton) {
        time = "Now"
        performSegue(withIdentifier: "Time_Confirm", sender: self)
    }
    
    @IBAction func selectIn30(_ sender: UIButton) {
        time = "In30"
        performSegue(withIdentifier: "Time_Confirm", sender: self)
    }
    
    @IBAction func selectIn60(_ sender: UIButton) {
        time = "In60"
        performSegue(withIdentifier: "Time_Confirm", sender: self)
    }
    
     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ConfirmViewController
        {
            let vc = segue.destination as? ConfirmViewController
            vc?.phone = phone
            vc?.machine = machine
            vc?.time = time
            
        }
    }

}
