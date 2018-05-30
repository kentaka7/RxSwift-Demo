//
//  UsersViewModel.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation
import RxSwift

class UsersViewModel: NSObject {
    
    private var usersPublishSubject: PublishSubject <[User]>!
    private var userModel: UserModel!
    private var bag: DisposeBag!
    
    var usersObservable: Observable<[User]> {
        return self.usersPublishSubject.asObservable()
    }
    
    var users:[User] {
        return userModel.users ?? [User]()
    }
    
    override init() {
        super.init()
        
        bag = DisposeBag()
        usersPublishSubject = PublishSubject <[User]>()
        
        bindModel()
    }
    
    private func bindModel() {
        userModel = UserModel()
        userModel.usersObservable.subscribe(
            onNext:{[weak self] users in
                self?.usersPublishSubject.onNext(users)
            },
            onError:{ error in
                print("Error getting users list")
            }
        ).disposed(by: bag)
    }
    
    func loadUserList() {
        userModel.loadUserList()
    }
    
    func addNewUser() {
        userModel.addNewUser()
    }
}
