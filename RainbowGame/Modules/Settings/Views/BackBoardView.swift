//
//  BackBoardView.swift
//  RainbowGame
//
//  Created by Andrei Shpartou on 15/11/2023.
//

import UIKit

class BackBoardView: UIView {
    private enum Constants {
        static let backBoardLabelSideSpace: CGFloat = 10.0
        static let backBoardSwitchTrailingSpace: CGFloat = -10.0
    }
    
    private lazy var backBoardLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.text = "подложка для букв"
        return label
    }()
    
    private lazy var backBoardSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.isOn = true
        return toggleSwitch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(backBoardLabel)
        addSubview(backBoardSwitch)
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
