//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by sole on 2022/04/01.
//

import UIKit

fileprivate typealias UserDataSource = UITableViewDiffableDataSource<UserViewController.Section, User>
fileprivate typealias UsersSnapshot = NSDiffableDataSourceSnapshot<UserViewController.Section, User>

class UserViewController: UITableViewController {
    
    fileprivate enum Section {
        case main
    }
    
    private let alertService = AlertService()
    
    private var users = [User]()
    
    private var dataSource: UserDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }

}

extension UserViewController {
    
    @IBAction private func didTappAddButton() {
        let alert = alertService.createUserAlert { [weak self] name in
            self?.addNewUser(with: name)
        }
        present(alert, animated: true)
    }
    
    private func addNewUser(with name: String) {
        let user = User(name: name)
        users.append(user)
        createSnapshot(from: users)
    }
    
    private func configureDataSource() {
        dataSource = UserDataSource(tableView: tableView, cellProvider: { tableView, indexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = user.name
            return cell
        })
    }
    
    private func createSnapshot(from users: [User]) {
        var snapshot = UsersSnapshot()

        snapshot.appendSections([.main])
        snapshot.appendItems(users, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences:  true)

    }
}

extension UserViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = dataSource.itemIdentifier(for: indexPath) else { return }
        print(user)
    }
}
