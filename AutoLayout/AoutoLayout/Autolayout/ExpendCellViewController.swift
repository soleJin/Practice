//
//  ExpendCellViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/27.
//

import UIKit

typealias UserDataSource = UITableViewDiffableDataSource<Section, User>
typealias UserSnapshot = NSDiffableDataSourceSnapshot<Section, User>

class ExpendCellViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource: UserDataSource!
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        users = User.getTestData()
        configureDataSource()
        updateSnapshot()
        configureDelegate()
    }
}

extension ExpendCellViewController: UITableViewDelegate {
    
    private func configureDelegate() {
        tableView.delegate = self
    }
    
    private func configureDataSource() {
        dataSource = UserDataSource(tableView: tableView, cellProvider: { tableView, indexPath, userInfo in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpendCell.identifier, for: indexPath) as? ExpendCell else { return UITableViewCell() }
            cell.update(data: userInfo)
            return cell
        })
        dataSource.defaultRowAnimation = .fade
    }
    
    private func updateSnapshot() {
        var snapshot = UserSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(users, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        users[indexPath.row].isExpand = !users[indexPath.row].isExpand
        updateSnapshot()
    }
}

