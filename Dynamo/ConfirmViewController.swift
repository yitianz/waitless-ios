//
//  ConfirmViewController.swift
//  Dynamo
//
//  Created by Yitian Zou on 4/21/19.
//  Copyright © 2019 Yitian Zou. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var confirmBox: UIView!
    @IBOutlet weak var submitBox: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var machineLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var phone: String?
    var machine: String?
    var time: String?
    var estimate: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        confirmBox.layer.cornerRadius = 10
        confirmBox.layer.masksToBounds = true
        
        submitBox.layer.cornerRadius = 5
        submitBox.layer.masksToBounds = true
        
        backButton.layer.cornerRadius = 5
        backButton.layer.masksToBounds = true
        
        machineLabel.text = machine!
        timeLabel.text = time!
        phoneLabel.text = phone!
    }
    
    // MARK: Actions
    @IBAction func onSubmitRequest(_ sender: UIButton) {
        var date = Date()
        let calendar = Calendar.current
        if time! == "In30" {
            date = calendar.date(byAdding: .minute, value: 30, to: date)!
        } else if time! == "In60" {
            date = calendar.date(byAdding: .hour, value: 1, to: date)!
        }
        
        let request = Request(phone: phone!, machine: machine!, time: date)
        addRequest(request)
    }
    
    // MARK: Private methods
    func addRequest(_ request: Request) -> Void {
        let json = ["phone": request.phone, "machine": request.machine, "time": request.time]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let url = URL(string: "http://127.0.0.1:5000/add_request")!
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    return
                }
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:AnyObject]
                    print("Result -> \(result)")
                    self.estimateWaitTime(self.machine!)
                } catch {
                    print("Error -> \(error)")
                }
            }
            task.resume()
        } catch {
            print(error)
        }
    }
    
    func estimateWaitTime(_ machine: String) -> Int? {
        let json = ["machine": machine]
        var ret: Int?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let url = URL(string: "http://127.0.0.1:5000/estimate_wait_time")!
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    ret = nil
                }
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Int
                    print("Result -> \(result)")
                    ret = result
                    self.estimate = ret
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "Submit_Request", sender: self)
                    }
                    
                } catch {
                    print("Error -> \(error)")
                    ret = nil
                }
            }
            task.resume()
        } catch {
            print(error)
            ret = nil
        }
    return ret
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FinishViewController
        {
            let vc = segue.destination as? FinishViewController
            vc?.estimate = estimate
        }
    }
}
