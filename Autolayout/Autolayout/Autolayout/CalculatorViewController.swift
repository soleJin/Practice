//
//  CalculatorViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/26.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.layer.masksToBounds = true
        displayLabel.layer.cornerRadius = 20

        btn1.layer.cornerRadius = btn1.bounds.width / 2
    }
}
