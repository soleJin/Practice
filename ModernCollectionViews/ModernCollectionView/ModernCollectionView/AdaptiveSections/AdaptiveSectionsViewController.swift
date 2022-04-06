//
//  EmojiViewController.swift
//  ModernCollectionView
//
//  Created by sole on 2022/04/06.
//

import UIKit

enum SectionLayoutKind: Int, CaseIterable {
    case list, grid5, grid3
    func columnCount(for width: CGFloat) -> Int {
        let wideMode = width > 800
        switch self {
        case .list:
            return wideMode ? 2 : 1
        case .grid5:
            return wideMode ? 10 : 5
        case .grid3:
            return wideMode ? 6 : 3
        }
    }
}

class AdaptiveSectionsViewController: UIViewController {
    
    var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Adaptive Sections"
        configureHierarchy()
        configureDataSource()
    }
}

extension AdaptiveSectionsViewController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            guard let layoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            let deviceWidth = layoutEnvironment.container.effectiveContentSize.width
            let columns = layoutKind.columnCount(for: deviceWidth)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = layoutKind == .list ? NSCollectionLayoutDimension.absolute(44) : NSCollectionLayoutDimension.fractionalWidth(1.0 / CGFloat(columns))
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitem: item,
                                                           count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionLayoutKind, Int>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return nil }
            cell.label.text = "🤯"
 
            if SectionLayoutKind(rawValue: indexPath.section) != .list {
                cell.label.textAlignment = .center
            }
            if SectionLayoutKind(rawValue: indexPath.section) == .grid5 {
                cell.label.font = UIFont.preferredFont(forTextStyle: .title2)
            }
            if SectionLayoutKind(rawValue: indexPath.section) == .grid3 {
                cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
            }
            return cell
        })
        
        // initial data
        let itemsPerSection = 10
        var snapshot = NSDiffableDataSourceSnapshot<SectionLayoutKind, Int>()
        SectionLayoutKind.allCases.forEach {
            snapshot.appendSections([$0])
            let itemOffset = $0.rawValue * itemsPerSection
            let itemUpperbound = itemOffset + itemsPerSection
            snapshot.appendItems(Array(itemOffset..<itemUpperbound))
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension AdaptiveSectionsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
