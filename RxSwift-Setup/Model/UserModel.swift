//
//  UserModel.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation
import RxSwift

class UserModel: NSObject {
    
    var users: [User]!
    
    private var userService: UserService!
    private var usersPublishSubject: PublishSubject<[User]>!
    
    var usersObservable: Observable<[User]> {
        return usersPublishSubject.asObservable()
    }
    
    override init() {
        users = [User]()
        userService = UserService()
        usersPublishSubject = PublishSubject<[User]>()
    }
    
    func loadUserList() {
        userService.loadUserList { [weak self] users in
            self?.users = users
            self?.usersPublishSubject.onNext(users)
        }
    }
    
    func addNewUser() {
        userService.addNewUser { [weak self] user in
            self?.users.append(user)
            self?.usersPublishSubject.onNext((self?.users)!)
        }
    }
}
