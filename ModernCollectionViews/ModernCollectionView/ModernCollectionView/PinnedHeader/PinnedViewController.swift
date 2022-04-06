//
//  PinnedViewController.swift
//  ModernCollectionView
//
//  Created by sole on 2022/04/06.
//

import UIKit

class PinnedViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Int>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Int>
    
    var dataSource: DataSource! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pinned Section Headers"
        configureHierarchy()
        configureDataSource()
    }
}

extension PinnedViewController {
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let gourpSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gourpSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                               heightDimension: .estimated(44)),
                            elementKind: "Header",
                            alignment: .top)
        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = 2
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.register(TitleSupplementaryView.self,
                                forSupplementaryViewOfKind: "Header",
                                withReuseIdentifier: TitleSupplementaryView.identifier)
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return UICollectionViewCell() }
            cell.label.text = "🥰"
            return cell
            
        })
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            let header = self.collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: TitleSupplementaryView.identifier, for: index) as? TitleSupplementaryView
            switch index.section {
            case 0:
                header?.update(title: "첫번재")
            case 1:
                header?.update(title: "두번째")
            case 2:
                header?.update(title: "세번째")
            default:
                header?.update(title: "나머지")
            }
            return header
        }
        
        let itemsPerSection = 5
        let sections = Array(0..<5)
        var snapshot = Snapshot()
        var itemOffset = 0
        sections.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems(Array(itemOffset..<itemOffset+itemsPerSection))
            itemOffset += itemsPerSection
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension PinnedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
