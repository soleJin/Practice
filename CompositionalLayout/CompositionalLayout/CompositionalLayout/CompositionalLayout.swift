//
//  CompositionalLayout.swift
//  CompositionalLayout
//
//  Created by sole on 2022/04/01.
//

import Foundation
import UIKit

final class CompositionalLayout {
    static var layout: UICollectionViewCompositionalLayout {
        
        // 1st Items
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                                                        widthDimension: .fractionalWidth(2/3),
                                                        heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0)
        
        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                                                        widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .fractionalHeight(0.5)))
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0)
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
                                                                            widthDimension: .fractionalWidth(1/3),
                                                                            heightDimension: .fractionalHeight(1.0)),
                                                                  subitem: verticalStackItem,
                                                                  count: 2)
        // 1st Group
        let horizontalGroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalWidth(2/3)),
                                                       subitems: [item, verticalStackGroup])
        // 2nd Items
        let tripleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1/3),
                                                                heightDimension: .fractionalWidth(1/3)))
        tripleItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0)
        
        // 2nd Group
        let tripleHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                                                                                widthDimension: .fractionalWidth(1.0),
                                                                                heightDimension: .fractionalWidth(1/3)),
                                                                      subitem: tripleItem,
                                                                      count: 3)
        // 3rd Group
        let horizntalGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalWidth(2/3)),
                                                        subitems: [verticalStackGroup, item])
        // final Group
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
                                                                        widthDimension: .fractionalWidth(1.0),
                                                                        heightDimension: .fractionalWidth(2.0)),
                                                             subitems: [horizontalGroup1, tripleHorizontalGroup, horizntalGroup2, tripleHorizontalGroup])
        
        // Sections
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
}
