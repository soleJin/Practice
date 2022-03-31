//
//  MyCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by sole on 2022/03/31.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        contentView.layer.cornerRadius = 8
    }
    
    func update(imageName: String) {
        characterImageView.image = UIImage(named: imageName)
    }
}
