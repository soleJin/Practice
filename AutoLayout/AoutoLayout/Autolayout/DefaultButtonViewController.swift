//
//  DefaultButtonViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/27.
//

import UIKit

class DefaultButtonViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != "show floating buttons" else { return }
        guard let floatingBtnsVC = segue.destination as? FloatingButtonsViewController else { return }
        floatingBtnsVC.modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
