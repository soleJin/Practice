//
//  ExpendCell.swift
//  Autolayout
//
//  Created by sole on 2022/04/27.
//

import UIKit

class ExpendCell: UITableViewCell {
    
    static let identifier = String(describing: ExpendCell.self)
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func update(data: User) {
        profileImageView.image = data.profileImage
        titleLabel.text = data.name
        if data.isExpand {
            descriptionLabel.numberOfLines = 0
        } else {
            descriptionLabel.numberOfLines = 1
        }
        descriptionLabel.text = data.description
    }
}
