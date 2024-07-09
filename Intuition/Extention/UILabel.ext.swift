//
//  UILabel.ext.swift
//  Intuition
//
//  Created by Василий Тихонов on 08.07.2024.
//

import UIKit
// Family: Minecraft Rus Font names: ["Minecraft"]

extension UILabel {
    func setLabelFont(_ size: CGFloat = 20) {
        self.font = UIFont(name: "Minecraft", size: size)
        self.numberOfLines = 0
    }
}
