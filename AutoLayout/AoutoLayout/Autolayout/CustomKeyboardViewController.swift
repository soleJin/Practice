//
//  CustomKeyboardViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/26.
//

import UIKit

class CustomKeyboardViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomKeyboard()
    }
    
    private func setCustomKeyboard() {
        let loadView = Bundle.main.loadNibNamed(CustomKeyboardView.identifier, owner: nil, options: nil)
        guard let customKeyboardView = loadView?.first as? CustomKeyboardView else { return }
        customKeyboardView.delegate = self
        
        textField.inputView = customKeyboardView
    }
}

extension CustomKeyboardViewController: SendNumber {
    func tapped(numberButton: String) {
        guard let oldText = textField.text else {
            textField.text = numberButton
            return
        }
        
        let newText = oldText + numberButton
        let trimmedText = newText.components(separatedBy: ",").joined()
        guard let newNumber = Int(trimmedText) else {
            print("=====숫자로 왜안바뀌는거야?=====")
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let resultText = numberFormatter.string(from: NSNumber(value: newNumber))
        textField.text = resultText
    }
}
