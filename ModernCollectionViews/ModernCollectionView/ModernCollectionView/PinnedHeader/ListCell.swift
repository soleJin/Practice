//
//  ListCell.swift
//  ModernCollectionView
//
//  Created by sole on 2022/04/06.
//

import UIKit

class ListCell: UICollectionViewCell {
    static let identifier = "list-cell"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ListCell {
    func configure() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        backgroundColor = .secondarySystemBackground
        label.backgroundColor = .systemYellow
        contentView.backgroundColor = .purple
        let inset = CGFloat(7)
        NSLayoutConstraint.activate([
            // contentView 기준 정렬XXXXXXXX
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        label.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}
