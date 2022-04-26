//
//  CustomKeyboardView.swift
//  Autolayout
//
//  Created by sole on 2022/04/27.
//

import UIKit

protocol SendNumber: AnyObject {
    func tapped(numberButton: String)
}

class CustomKeyboardView: UIView {
    static let identifier = String(describing: CustomKeyboardView.self)
    weak var delegate: SendNumber?
    
    @IBAction func tappedButton(sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        delegate?.tapped(numberButton: number)
    }
}


