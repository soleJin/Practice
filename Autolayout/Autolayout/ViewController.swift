//
//  ViewController.swift
//  Autolayout
//
//  Created by sole on 2022/04/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myButton = UIButton.init(type: .system)
        myButton.setTitle("my Buttion", for: .normal)
        
        view.addSubview(myButton)
        
        // 배치할 때는 frame으로 설정하지 않는다.
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let myLabel = UILabel.init()
        myLabel.text = "my Label"
        view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
    }


}

