//
//  ViewController.swift
//  Intuition
//
//  Created by Василий Тихонов on 08.07.2024.
//

import UIKit

class GameViewController: UIViewController {

    lazy var coordinator = {
        return Coordinator(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.setEnviroment()
    }
}

