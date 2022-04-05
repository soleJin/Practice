//
//  DataSource.swift
//  MultipleSectionsInTableView
//
//  Created by sole on 2022/04/05.
//

import UIKit

class DataSource: UITableViewDiffableDataSource<Category, Item> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let category = Category(rawValue: section) else { return "noSectionToFit" }
        var sectionHeaderTitle = category.sectionHeaderTitle
        if category == .soppingCart {
            sectionHeaderTitle = "🛒 " + sectionHeaderTitle
        }
        return sectionHeaderTitle
    }
    
    // deleting items
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var snapshot = self.snapshot()
            if let item = itemIdentifier(for: indexPath) {
                snapshot.deleteItems([item])
                apply(snapshot, animatingDifferences: true)
            }
        }
    }
    
    
    // reodering items
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // case1
        guard sourceIndexPath != destinationIndexPath else {
            print("move to self")
            return
        }
        
        guard let sourceItem = itemIdentifier(for: sourceIndexPath) else {
            print("sourceItem 찾지 못함")
            return
        }
        
        var snapshot = self.snapshot()
        snapshot.deleteItems([sourceItem])
        
        guard let destinationItem = itemIdentifier(for: destinationIndexPath) else {
            // case4
            let destinationSection = snapshot.sectionIdentifiers[destinationIndexPath.section]
            snapshot.appendItems([sourceItem], toSection: destinationSection)
            apply(snapshot, animatingDifferences: true)
            return
        }
        
        guard let sourceIndex = snapshot.indexOfItem(sourceItem),
              let destinationIndex = snapshot.indexOfItem(destinationItem) else {
            print("sourceIndex or destinationIndex를 찾지 못함")
            return
        }
        
        let isAfter = sourceIndex < destinationIndex &&
        snapshot.sectionIdentifier(containingItem: sourceItem) == snapshot.sectionIdentifier(containingItem: destinationItem)
        
        // case2(after)
        if isAfter {
            snapshot.insertItems([sourceItem], afterItem: destinationItem)
        }
        
        // case3(before)
        if !isAfter {
            snapshot.insertItems([sourceItem], beforeItem: destinationItem)
        }
        apply(snapshot, animatingDifferences: true)
    }
}
