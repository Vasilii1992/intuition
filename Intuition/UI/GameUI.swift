//
//  GameUI.swift
//  Intuition
//
//  Created by Василий Тихонов on 09.07.2024.
//

import UIKit

final class GameUI {

    private var bounds: CGRect?
    
    init() {
        self.bounds = UIScreen.main.bounds
    }
    
    lazy var backgroundSprite: UIImageView = {
        let image = UIImageView()
        image.image = .backImg
        image.frame = bounds ?? .zero
        return image
    }()
    
    lazy var leftDoor: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 126, height: 140)
        button.tag = 1
        button.setBackgroundImage(.door1Close, for: .normal)
        button.setBackgroundImage(.door1Open, for: .highlighted)
        
        return button
    }()
    
    lazy var rightDoor: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 126, height: 140)
        button.tag = 2
        button.setBackgroundImage(.door2Close, for: .normal)
        button.setBackgroundImage(.door2Open, for: .highlighted)
        
        return button
    }()
    
    lazy var buttonsView: UIView = {
        $0.frame.size = CGSize(width: (bounds?.width ?? .zero) - 60, height: 140)
        
        return $0
    }(UIView())
    
    
    lazy var selectedLabel = createTextLabel(labelText: .selected, labelFontSize: 20)
    lazy var recordLabel = createTextLabel(labelText: .record, color: .black, labelFontSize: 30)
    lazy var recordValue = createTextLabel(labelText: .zero, color: .black, labelFontSize: 30)
    lazy var correctLabel = createTextLabel(labelText: .correct,color: .appGreen, labelFontSize: 20)
    lazy var inCorrectLabel = createTextLabel(labelText: .inCorrect,color: .appRed, labelFontSize: 20)

    lazy var scoreLabel = createTextLabel(labelText: .score, labelFontSize: 40)
    lazy var scoreValue = createTextLabel(labelText: .zero, labelFontSize: 40)
    lazy var scoreDescription = getScoreDescriptionLabel(score: 0)
    
    private func getScoreDescriptionLabel(score: Int) -> UILabel {
        let description = createTextLabel(labelText: .zero, labelFontSize: 20)
        description.text = LabelStrings.getCurrentResultText(score: score)
        return description
    }

//MARK: Stack
    private lazy var scoreResultStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(UIView())
        stack.addArrangedSubview(scoreLabel)
        stack.addArrangedSubview(scoreValue)
        stack.addArrangedSubview(UIView())
        
        return stack
    }()
    
    private lazy var scoreStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.addArrangedSubview(selectedLabel)
        stack.addArrangedSubview(scoreResultStack)
        
        return stack
    }()
    
     lazy var mainLabelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.alignment = .center
        stack.frame.size = CGSize(width: bounds?.width ?? .zero, height: 140)
        stack.addArrangedSubview(scoreStack)
        stack.addArrangedSubview(scoreDescription)

        return stack
    }()
    
    private func createTextLabel(labelText: LabelStrings,color: UIColor = .white,labelFontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.setLabelFont(labelFontSize)
        label.text = labelText.rawValue
        label.textColor = color

        return label
    }
}

enum LabelStrings: String {
    case empty = ""
    case zero = "0"
    case selected = "Выберете дверь"
    case record = "Рекорд:"
    case correct = "Верно!"
    case inCorrect = "Неверно!"
    case score = "Счет:"
    
    
    static func getCurrentResultText(score: Int) -> String {
        switch score {
        case 0:
            return ""
        case 3:
            return "Повезло"
        case 5:
            return "Ты что, экстрасенс?"
        case 7:
            return "Вызывайте экзорциста!"
        case 9:
            return "Это почти мировой рекорд!"
        default :
            return ""
        }
    }
}
