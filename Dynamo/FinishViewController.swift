//
//  FinishViewController.swift
//  Dynamo
//
//  Created by Yitian Zou on 4/21/19.
//  Copyright © 2019 Yitian Zou. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var waitTime: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
    
    var estimate: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        waitTime.layer.cornerRadius = 10
        waitTime.layer.masksToBounds = true
        
        startOverButton.layer.cornerRadius = 5
        startOverButton.layer.masksToBounds = true
        
        waitTime.text = "Estimate Wait Time: \(estimate!) min"
        
    }
    
}
