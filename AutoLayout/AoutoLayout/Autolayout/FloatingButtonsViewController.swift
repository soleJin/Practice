//
//  FloatingButtonsViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/27.
//

import UIKit

class FloatingButtonsViewController: UIViewController {
    
    @IBOutlet weak var footPrintCenterY: NSLayoutConstraint!
    @IBOutlet weak var boneCenterY: NSLayoutConstraint!
    @IBOutlet weak var dogCenterY: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnsCenterY(footPrint: 0, bone: 0, dog: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setBtnsCenterY(footPrint: 80, bone: 160, dog: 240)
        // Damping이 0에 가까울수록 심하게 흔들림
        // Velocity: 부드럽게?
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { bool in
            // 애니매이션이 끝나는 시점
        }
    }
    
    private func setBtnsCenterY(footPrint: CGFloat, bone: CGFloat, dog: CGFloat) {
        footPrintCenterY.constant = footPrint
        boneCenterY.constant = bone
        dogCenterY.constant = dog
    }

    @IBAction func tappedCloseBtn(sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.setBtnsCenterY(footPrint: 0, bone: 0, dog: 0)
            self.view.layoutIfNeeded()
        } completion: { bool in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
