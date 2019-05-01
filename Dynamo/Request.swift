//
//  Request.swift
//  Dynamo
//
//  Created by Yitian Zou on 4/23/19.
//  Copyright © 2019 Yitian Zou. All rights reserved.
//

import UIKit


class Request {
    // MARK: Properties
    var phone: String
    var machine: String
    var time: String
    
    init(phone: String, machine: String, time: Date) {
        // Initialize stored properties.
        self.phone = phone
        self.machine = machine
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.time = df.string(from: time)
    }
}
