//
//  User.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

class User: NSObject {
    var id: String!
    var name: String!
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
