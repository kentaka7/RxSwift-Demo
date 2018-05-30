//
//  UserCordinator.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

class UserCordinator: Cordinator {
    
    private var window: UIWindow!
    var cordinatorDelegate:AppCordinator!
    
    init(withWindow: UIWindow) {
        self.window = withWindow
    }
    
    func start() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let usersVC = sb.instantiateViewController(withIdentifier: "UsersVC") as? UsersVC {
            window.rootViewController = usersVC
        }
    }
}
