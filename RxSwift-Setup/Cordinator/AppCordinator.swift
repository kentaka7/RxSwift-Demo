//
//  AppCordinator.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

class AppCordinator: Cordinator {
    
    private var window: UIWindow!
    private var cordinators: [CordinatorId : Cordinator]!
    
    init(withWindow: UIWindow) {
        self.window = withWindow
        cordinators = [CordinatorId : Cordinator]()
    }
    
    func start() {
        let userCordinator = UserCordinator(withWindow: self.window)
        self.cordinators[.users] = userCordinator
        userCordinator.cordinatorDelegate = self
        userCordinator.start()
    }
    
}
