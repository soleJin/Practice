//
//  TitleSupplementaryView.swift
//  ModernCollectionView
//
//  Created by sole on 2022/04/06.
//

import UIKit

class TitleSupplementaryView: UICollectionReusableView {
    static let identifier = "title-supplementary-view"
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TitleSupplementaryView {
    func configure() {
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        backgroundColor = .systemGray2
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        let inset = CGFloat(10)
        // 안띄워주면 딱붙
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        
    }
    
    func update(title: String? = nil) {
        label.text = title
    }
}
