//
//  RulesViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    private lazy var rectView: UIView = {
        var rectView = UIView()
        rectView.backgroundColor = .white

        return rectView
    }()
    
    private lazy var backButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        
        return button
    }()
    
    private lazy var helpLabel: UILabel = {
        var label = UILabel()
        label.text = "Помощь"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var rulesLabel: UILabel = {
        var rulesLabel = UILabel()
        rulesLabel.text = "ПРАВИЛА ИГРЫ"
        rulesLabel.textAlignment = .center
        rulesLabel.textColor = UIColor(rgb: 0xBE2E6A)
        rulesLabel.font = .systemFont(ofSize: 24)
        
        return rulesLabel
    }()
    
    private lazy var rulesTextOne: UILabel = {
        var rulesTextOne = UILabel()
        rulesTextOne.textColor = .black
        let tempText = NSAttributedString(string: "«синий»", attributes: [.foregroundColor: UIColor.red])
        let mainText = "На экране в случайном месте появляется слово, обозначающее цвет, например: написано \n" + tempText.string + ":"
        let attributedText = NSMutableAttributedString(string: mainText)
        attributedText.setAttributes([.foregroundColor: UIColor.black], range: NSRange(location: 0, length: mainText.count))
        attributedText.setAttributes([.foregroundColor: UIColor.red], range: (mainText as NSString).range(of: tempText.string))
        rulesTextOne.attributedText = attributedText
        rulesTextOne.font = .systemFont(ofSize: 20)
        rulesTextOne.numberOfLines = 0
        
        return rulesTextOne
    }()
    
    private lazy var rulesTextTwo: UILabel = {
        var rulesTextTwo = UILabel()
        rulesTextTwo.textColor = .black
        let tempText = NSAttributedString(string: "говорим «зеленый»", attributes: [.foregroundColor: UIColor.red])
        let mainText = "Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена):\n" + tempText.string + ".\n\nВ игре можно изменять скорость от 1x до 5x. А так же длительность игры."
        let attributedText = NSMutableAttributedString(string: mainText)
        attributedText.setAttributes([.foregroundColor: UIColor.black], range: NSRange(location: 0, length: mainText.count))
        attributedText.setAttributes([.foregroundColor: UIColor.red], range: (mainText as NSString).range(of: tempText.string))
        rulesTextTwo.attributedText = attributedText
        rulesTextTwo.font = .systemFont(ofSize: 20)
        rulesTextTwo.numberOfLines = 0
        
        return rulesTextTwo
    }()
    
    private lazy var labelOn: UILabel = {
        var labelOn = UILabel()
        labelOn.font = .systemFont(ofSize: 10)
        labelOn.textColor = .black
        labelOn.numberOfLines = 0
        labelOn.text = "подложка включена:"
        
        return labelOn
    }()
    
    private lazy var labelOff: UILabel = {
        var labelOff = UILabel()
        labelOff.font = .systemFont(ofSize: 10)
        labelOff.textColor = .black
        labelOff.numberOfLines = 0
        labelOff.text = "подложка выключена:"
        
        return labelOff
    }()

    private lazy var leftImage: UIImageView = {
        var leftImage = UIImageView()
        leftImage.image = UIImage(named: "leftImageRulesVC")
        
        return leftImage
    }()
    
    private lazy var rightImage: UIImageView = {
        var rightImage = UIImageView()
        rightImage.image = UIImage(named: "rightImageRulesVC")
        
        return rightImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setConstraints()
    }
    
    private func setUpViews() {
        view.backgroundColor = .gray
        view.addSubview(rectView)
        view.addSubview(backButton)
        view.addSubview(helpLabel)
        rectView.addSubview(rulesLabel)
        rectView.addSubview(rulesTextOne)
        rectView.addSubview(rulesTextTwo)
        rectView.addSubview(labelOn)
        rectView.addSubview(labelOff)
        rectView.addSubview(leftImage)
        rectView.addSubview(rightImage)
    }
    
    private func setConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 42),
            backButton.widthAnchor.constraint(equalToConstant: 37),
            backButton.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            helpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 39),
            helpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121),
            helpLabel.widthAnchor.constraint(equalToConstant: 34),
            helpLabel.heightAnchor.constraint(equalToConstant: 39),
            helpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        rectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rectView.widthAnchor.constraint(equalToConstant: 298),
            rectView.heightAnchor.constraint(equalToConstant: 589),
            rectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            rectView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160)
        ])
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesLabel.widthAnchor.constraint(equalToConstant: 225),
            rulesLabel.heightAnchor.constraint(equalToConstant: 21),
            rulesLabel.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 34),
            rulesLabel.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 18)
        ])
        
        rulesTextOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesTextOne.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 26),
            rulesTextOne.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 49),
            rulesTextOne.widthAnchor.constraint(equalToConstant: 263),
            rulesTextOne.heightAnchor.constraint(equalToConstant: 143)
        ])
        
        rulesTextTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesTextTwo.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 26),
            rulesTextTwo.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 268),
            rulesTextTwo.widthAnchor.constraint(equalToConstant: 258),
            rulesTextTwo.heightAnchor.constraint(equalToConstant: 303)
        ])
        
        labelOff.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelOff.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 21),
            labelOff.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 200),
            labelOff.widthAnchor.constraint(equalToConstant: 118),
            labelOff.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        labelOn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelOn.trailingAnchor.constraint(equalTo: rectView.trailingAnchor, constant: -15),
            labelOn.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 200),
            labelOn.widthAnchor.constraint(equalToConstant: 118),
            labelOn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftImage.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 38),
            leftImage.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 230),
            leftImage.widthAnchor.constraint(equalToConstant: 80),
            leftImage.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightImage.trailingAnchor.constraint(equalTo: rectView.trailingAnchor, constant: -38),
            rightImage.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 214),
            rightImage.widthAnchor.constraint(equalToConstant: 89),
            rightImage.heightAnchor.constraint(equalToConstant: 54)
        ])
    }

}
