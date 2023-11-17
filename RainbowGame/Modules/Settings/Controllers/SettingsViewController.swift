//
//  SettingsViewController.swift
//  RainbowGame
//
//  Created by Andrei Shpartou on 15/11/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    private enum Constants {
        static let commonViewBackGroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        static let commonViewCornerRadius: CGFloat = 10.0
        static let commonViewHeight: CGFloat = 65.0
        
        static let commonSideSpacing: CGFloat = 20.0
        static let settingsStackViewTopSpacing: CGFloat = 115.0
    }
    
    private lazy var playTimeView: PlayTimeView  = {
        let view = PlayTimeView()
        view.backgroundColor = Constants.commonViewBackGroundColor
        view.layer.cornerRadius = Constants.commonViewCornerRadius        
        return view
    }()
    
    private lazy var taskSpeedView: TaskSpeedView  = {
        let view = TaskSpeedView()
        view.backgroundColor = Constants.commonViewBackGroundColor
        view.layer.cornerRadius = Constants.commonViewCornerRadius
        return view
    }()
    
    private lazy var backBoardView: BackBoardView  = {
        let view = BackBoardView()
        view.backgroundColor = Constants.commonViewBackGroundColor
        view.layer.cornerRadius = Constants.commonViewCornerRadius
        return view
    }()
    
    private lazy var settingsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playTimeView, taskSpeedView, backBoardView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15.0
        return stackView
    }()
    
    private let settingsManager = SettingsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.7994344831, green: 0.7994344831, blue: 0.7994344831, alpha: 1)        
        view.addSubview(settingsStackView)
    }
        
    @objc func playTimeSliderChanged(_ sender: UISlider) {
        let playTimeRounded = sender.value.rounded()
        sender.setValue(playTimeRounded, animated: false)
        settingsManager.set(playTimeRounded, forKey: .playTime)
        playTimeView.playTimeResultLabel.text = String(format: "%.0f", playTimeRounded)
        
    }
    
    @objc func taskSpeedSliderChanged(_ sender: UISlider) {
        let taskSpeedRounded = sender.value.rounded()
        sender.setValue(taskSpeedRounded, animated: false)
        settingsManager.set(taskSpeedRounded, forKey: .taskSpeed)
        taskSpeedView.taskSpeedResultLabel.text = String(format: "%.0f", taskSpeedRounded)
    }
    
    @objc func backBoardSwitchChanged(_ sender: UISwitch) {
        settingsManager.set(sender.isOn, forKey: .backBoardShowing)
    }
    
    private func setConstraints() {
        
        settingsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.commonSideSpacing),
            settingsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.commonSideSpacing),
            settingsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.settingsStackViewTopSpacing),            
        ])
        NSLayoutConstraint.activate([
            playTimeView.topAnchor.constraint(equalTo: settingsStackView.topAnchor),
            playTimeView.bottomAnchor.constraint(equalTo: settingsStackView.topAnchor, constant: Constants.commonViewHeight)
        ])
    }
}
