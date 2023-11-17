//
//  BackBoardView.swift
//  RainbowGame
//
//  Created by Andrei Shpartou on 15/11/2023.
//

import UIKit

class BackBoardView: UIView {
    private enum Constants {
        static let backBoardLabelSideSpace: CGFloat = 5.0
        static let backBoardSwitchTrailingSpace: CGFloat = -10.0
    }
    
    private lazy var backBoardLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.text = "подложка для букв"
        return label
    }()
    
    private lazy var backBoardSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.addTarget(nil, action: #selector(SettingsViewController.backBoardSwitchChanged), for: .valueChanged)
        return toggleSwitch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupSettings()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(backBoardLabel)
        addSubview(backBoardSwitch)
    }
    
    private func setupSettings() {
        let settingsManager = SettingsManager()        
        backBoardSwitch.isOn = settingsManager.get(forKey: .backBoardShowing) as! Bool
    }
    
    private func setConstraints() {
        backBoardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBoardLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            backBoardLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.backBoardLabelSideSpace)
        ])
        backBoardSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBoardSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            backBoardSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.backBoardSwitchTrailingSpace)
        ])
    }
}
