//
//  Coordinator.swift
//  Intuition
//
//  Created by Василий Тихонов on 09.07.2024.
//

import UIKit

final class Coordinator {
    
   private weak var controller: UIViewController?
    private var view: UIView?
    
    private var UI = GameUI()
    private var gameEngine = GameEngine()
    
    init(controller: UIViewController? = nil) {
        self.controller = controller
        self.view = controller?.view
    }
    
    private lazy var buttonView: UIView = {
        let view = UI.buttonsView
        view.addSubview(leftDoor)
        view.addSubview(rightDoor)
        
        return view
    }()
    
    private lazy var leftDoor: UIButton = {
        let btn = UI.leftDoor
        btn.addTarget(self, action: #selector(selectDoor(sender: )), for: .touchUpInside)
        return btn
    }()
    
    private lazy var rightDoor: UIButton = {
        let btn = UI.rightDoor
        btn.addTarget(self, action: #selector(selectDoor(sender: )), for: .touchUpInside)
        return btn
    }()
    
    func setEnviroment() {
        guard let view = view else { return }
        UI.recordValue.text = "\(gameEngine.record)"

        view.addSubview(UI.backgroundSprite)
        
        [UI.recordLabel,UI.recordValue,UI.mainLabelStack,buttonView].forEach {
            view.addSubview($0)
        }
        
        UI.recordLabel.frame = CGRect(x: 30, y: 80, width: 150, height: 40)
        UI.recordValue.frame = CGRect(x: 175, y: 80, width: 60, height: 40)
        
        UI.mainLabelStack.center.x = view.center.x
        UI.mainLabelStack.center.y = view.center.y - 80
        
        UI.rightDoor.frame.origin.x = buttonView.frame.width - 126
        buttonView.center.y = view.center.y + 80
        buttonView.center.x = view.center.x

    }
    
    @objc func selectDoor(sender: UIButton) {
        let side = sender.tag == 1 ? false : true
        if gameEngine.gameAction(side: side) {
            UI.selectedLabel.text = UI.correctLabel.text
            UI.selectedLabel.textColor = UI.correctLabel.textColor
        }
        else {
            UI.selectedLabel.text = UI.inCorrectLabel.text
            UI.selectedLabel.textColor = UI.inCorrectLabel.textColor
        }
        UI.scoreValue.text = "\(gameEngine.score)"
        UI.scoreDescription.text = LabelStrings.getCurrentResultText(score: gameEngine.score)
        UI.recordValue.text = "\(gameEngine.record)"
    }
}
