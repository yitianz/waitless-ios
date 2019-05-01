//
//  MachineViewController.swift
//  Dynamo
//
//  Created by Yitian Zou on 4/21/19.
//  Copyright © 2019 Yitian Zou. All rights reserved.
//

import UIKit

class MachineViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var treadmillBox: UIButton!
    @IBOutlet weak var ellipticalBox: UIButton!
    @IBOutlet weak var stairmasterBox: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var phone: String?
    var machine: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let boxes = [treadmillBox, ellipticalBox, stairmasterBox]
        for box in boxes {
            box!.layer.cornerRadius = 10
            box!.layer.masksToBounds = true
        }
        
        backButton.layer.cornerRadius = 5
        backButton.layer.masksToBounds = true
        
    }
    
    
    // MARK: Actions
    @IBAction func selectTreadmill(_ sender: UIButton) {
        machine = "Treadmill"
        performSegue(withIdentifier: "Machine_Time", sender: self)
    }
    @IBAction func selectElliptical(_ sender: UIButton) {
        machine = "Elliptical"
        performSegue(withIdentifier: "Machine_Time", sender: self)
    }
    @IBAction func selectStairmaster(_ sender: UIButton) {
        machine = "Stairmaster"
        performSegue(withIdentifier: "Machine_Time", sender: self)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TimeViewController
        {
            let vc = segue.destination as? TimeViewController
            vc?.phone = phone
            vc?.machine = machine
        }
    }

}
