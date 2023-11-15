//
//  MainView.swift
//  RainbowGame
//
//  Created by Кристина Максимова on 14.11.2023.
//

import UIKit

class MainView: UIView {
    
    private lazy var rainbowView: UIImageView = {
        var view = UIImageView(image: UIImage(named: "icon_rainbow"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabelGame: UILabel = {
        var label = UILabel()
        label.text = "НЛП игра"
        label.font = UIFont(name: "SFPro-Regular", size: 36)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabelGame: UILabel = {
        var label = UILabel()
        label.text = "Радуга"
        label.font = UIFont(name: "CormorantInfant-Regular", size: 40)
        label.textColor = UIColor(named: "nameGameTextColor")
        label.textAlignment = .center
        label.layer.shadowPath = UIBezierPath(rect: label.bounds).cgPath
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 4
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startButtonGame: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "startButtonColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        button.layer.shadowOpacity = 10
        button.layer.shadowRadius = 24
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.setTitle("Новая игра", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.tintColor = .white
        return button
    }()
    
    private lazy var statisticsButtonGame: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "statisticsButtonColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 24
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.setTitle("Статистика", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 20)
        button.tintColor = .white
        return button
    }()
    
    private lazy var settingsButtonGame: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon _settings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        return button
    }()

    private lazy var questionsButtonGame: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon _question"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        return button
    }()

    init() {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(named: "backgroundColor")
        setViews()
        setConstraints()
    }
    
    func setViews() {
            addSubview(rainbowView)
            addSubview(descriptionLabelGame)
            addSubview(nameLabelGame)
            addSubview(startButtonGame)
            addSubview(statisticsButtonGame)
            addSubview(settingsButtonGame)
            addSubview(questionsButtonGame)
        }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [rainbowView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 72),
             rainbowView.heightAnchor.constraint(equalToConstant: 150),
             rainbowView.widthAnchor.constraint(equalToConstant: 337),
             rainbowView.centerXAnchor.constraint(equalTo: centerXAnchor),
             
             descriptionLabelGame.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 232),
             descriptionLabelGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 81),
             descriptionLabelGame.heightAnchor.constraint(equalToConstant: 71),
             descriptionLabelGame.widthAnchor.constraint(equalToConstant: 206),
             descriptionLabelGame.centerXAnchor.constraint(equalTo: centerXAnchor),
             
             nameLabelGame.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 272),
             nameLabelGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 81),
             nameLabelGame.heightAnchor.constraint(equalToConstant: 91),
             nameLabelGame.widthAnchor.constraint(equalToConstant: 206),
             nameLabelGame.centerXAnchor.constraint(equalTo: centerXAnchor),
             
             startButtonGame.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 134.5),
             startButtonGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 53),
             startButtonGame.heightAnchor.constraint(equalToConstant: 83),
             startButtonGame.widthAnchor.constraint(equalToConstant: 274),
             startButtonGame.centerXAnchor.constraint(equalTo: centerXAnchor),
             
             statisticsButtonGame.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 237),
             statisticsButtonGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 52),
             statisticsButtonGame.heightAnchor.constraint(equalToConstant: 83),
             statisticsButtonGame.widthAnchor.constraint(equalToConstant: 274),
             statisticsButtonGame.centerXAnchor.constraint(equalTo: centerXAnchor),
             
             settingsButtonGame.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35),
             settingsButtonGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
             settingsButtonGame.heightAnchor.constraint(equalToConstant: 50),
             settingsButtonGame.widthAnchor.constraint(equalToConstant: 50),
             
             questionsButtonGame.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35),
             questionsButtonGame.rightAnchor.constraint(equalTo: rightAnchor, constant: -28),
             questionsButtonGame.heightAnchor.constraint(equalToConstant: 50),
             questionsButtonGame.widthAnchor.constraint(equalToConstant: 50)]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
