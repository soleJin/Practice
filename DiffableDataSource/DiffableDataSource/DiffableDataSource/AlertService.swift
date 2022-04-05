//
//  AlertService.swift
//  DiffableDataSource
//
//  Created by sole on 2022/04/04.
//

import UIKit

struct AlertService {
    func createUserAlert(completion: @escaping (String) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: "Creat User", message: nil, preferredStyle: .alert)
        
        alert.addTextField { $0.placeholder = "Enter user's name" }
        
        let action = UIAlertAction(title: "Save", style: .default) { _ in
            let usersName = alert.textFields?.first?.text ?? ""
            completion(usersName)
        }
        alert.addAction(action)
        
        return alert
    }
}
