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
        
        guard let sourceItem = itemIdentifier(for: sourceIndexPath) else { return }
        
        // CASE 1: attempting to move to self
        guard sourceIndexPath != destinationIndexPath else {
            print("move to self")
            return
        }
        
        let destinationItem = itemIdentifier(for: destinationIndexPath)

        var snapshot = self.snapshot()
        
        // handle CASE 2 AND 3
        if let destinationItem = destinationItem {
            
            // get the source index and the destination index
            if let sourceIndex = snapshot.indexOfItem(sourceItem),
               let destinationIndex = snapshot.indexOfItem(destinationItem) {
                
                // what order should we be inserting the source item
                let isAfter = destinationIndex > sourceIndex
                && snapshot.sectionIdentifier(containingItem: sourceItem) ==
                snapshot.sectionIdentifier(containingItem: destinationItem)
                
                // first delete the source item from the snapshot
                snapshot.deleteItems([sourceItem])
                
                // CASE 2
                if isAfter {
                    print("after destination")
                    snapshot.insertItems([sourceItem], afterItem: destinationItem)
                }
                
                // CASE 3
                else {
                    print("before destination")
                    snapshot.insertItems([sourceItem], beforeItem: destinationItem)
                }
            }
        }
        
        // handle CASE 4
        // no index path at destination section
        else {
            print("new index path")
            
            let destinationSection = snapshot.sectionIdentifiers[destinationIndexPath.section]
            
            snapshot.deleteItems([sourceItem])
            snapshot.appendItems([sourceItem], toSection: destinationSection)
        }
        apply(snapshot, animatingDifferences: false)
    }
}
