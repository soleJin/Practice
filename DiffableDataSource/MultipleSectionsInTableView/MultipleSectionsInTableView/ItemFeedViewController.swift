//
//  ViewController.swift
//  MultipleSectionsInTableView
//
//  Created by sole on 2022/04/05.
//

import UIKit

class ItemFeedViewController: UIViewController {
    
    private var tableView: UITableView!
    private var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureTableView()
        configureDataSource()
    }
}

// DIFFABLE DATA SOURCE
extension ItemFeedViewController {
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = item.name
            return cell
        })
        dataSource.defaultRowAnimation = .fade
        
        var snapshot = NSDiffableDataSourceSnapshot<Category, Item>()
        for category in Category.allCases {
            let items = Item.getTestData().filter { $0.category == category }
            snapshot.appendSections([category])
            snapshot.appendItems(items)
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// NAVIGATIONBAR
extension ItemFeedViewController {
    private func configureNavBar() {
        navigationItem.title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toogleEditState))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddVC))
    }
    
    @objc private func toogleEditState() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        navigationItem.leftBarButtonItem?.title = tableView.isEditing ? "Done" : "Edit"
    }
    
    @objc private func presentAddVC() {
        guard let addItemVC = storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as? AddItemViewController else { return }
        addItemVC.delegate = self
        present(addItemVC, animated: true)
    }
}

extension ItemFeedViewController: AddItemViewControllerDelegate {
    func didAddNewItem(_ addItemViewController: AddItemViewController, item: Item) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([item], toSection: item.category)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
