//
//  UserService.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

class UserService: NSObject {
    
    func loadUserList(_ completionHandler:@escaping ([User]) -> (Void) ) {
        var users = [User]()
        users.append(User(id: "1", name: "John"))
        users.append(User(id: "2", name: "Sam"))
        users.append(User(id: "3", name: "Peter"))
        users.append(User(id: "4", name: "Julia"))
        users.append(User(id: "5", name: "Robert"))
        
        completionHandler(users)
    }
    
    func addNewUser(_ completionHandler: (User) -> (Void)) {
        let user = User(id: "10", name: "New User")
        completionHandler(user)
    }
}
