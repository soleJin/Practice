//
//  CornerRadiusViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/26.
//

import UIKit

class CornerRadiusViewController: UIViewController {
    
    
    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textView1.layer.cornerRadius = 50
        
        textView2.layer.masksToBounds = false
        textView2.layer.cornerRadius = 50
    }
}
