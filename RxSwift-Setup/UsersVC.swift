//
//  ViewController.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 29/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit
import RxSwift

class UsersVC: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    private var viewModel: UsersViewModel!
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindView()
    }
    
    private func setupView() {
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self
    }
    
    private func bindView() {
        viewModel = UsersViewModel()
        
        viewModel.usersObservable.subscribe(
            onNext: { [weak self] users in
                self?.usersTableView.reloadData()
            },
            onError: { error in
                print("Error getting user list!")
            }
        ).disposed(by: bag)
        
        viewModel.loadUserList()
    }
    
    @IBAction func didClickOnAddUserBtn(_ sender: Any) {
        viewModel.addNewUser()
    }
}

extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableCell", for: indexPath) as? UsersTableCell {
            let user = self.viewModel.users[indexPath.row]
            cell.setupView(user: user)
            return cell
        }
        
        return UITableViewCell()
    }
}

