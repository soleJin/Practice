//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by sole on 2022/03/31.
//

import UIKit

class ViewController: UIViewController {
    
    let imagesName: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17",]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.dataSource = self
    }
}

extension ViewController {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        collectionView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        // Items
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
        
        let tripleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1/3),
                                                                heightDimension: .fractionalWidth(1/3)))
        tripleItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0)
        
        let tripleHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                                                                                widthDimension: .fractionalWidth(1.0),
                                                                                heightDimension: .fractionalWidth(1/3)),
                                                                      subitem: tripleItem,
                                                                      count: 3)
        
        // Groups
        let horizontalGroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalWidth(2/3)),
                                                       subitems: [item, verticalStackGroup])
        
        let horizntalGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalWidth(2/3)),
                                                        subitems: [verticalStackGroup, item])
        
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

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 51
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell,
              let imageName = imagesName.randomElement() else { return UICollectionViewCell() }
        cell.update(imageName: imageName)
        return cell
    }
}

