//
//  TaskSpeedView.swift
//  RainbowGame
//
//  Created by Andrei Shpartou on 15/11/2023.
//

import UIKit

class TaskSpeedView: UIView {
    private enum Constants {
        static let taskSpeedLabelSideSpace: CGFloat = 5.0
        static let taskSpeedSliderTrailingSpace: CGFloat = -40.0
        static let taskSpeedSliderLeadingSpace: CGFloat = 140.0
        static let taskSpeedResultLabelTrailingSpace: CGFloat = -10.0
    }
    
    private lazy var taskSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.text = "скорость смены\nзаданий, сек"
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var taskSpeedSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 6        
        slider.tintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        slider.isContinuous = true
        slider.addTarget(nil, action: #selector(SettingsViewController.taskSpeedSliderChanged), for: .valueChanged)
        return slider
    }()
    
    var taskSpeedResultLabel: UILabel = {
        let label = UILabel()       
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
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
        addSubview(taskSpeedLabel)
        addSubview(taskSpeedSlider)
        addSubview(taskSpeedResultLabel)
    }
    
    private func setupSettings() {
        let settingsManager = SettingsManager()
        let taskSpeedValue = settingsManager.get(forKey: .taskSpeed) as! Double
        taskSpeedSlider.value = Float(taskSpeedValue)
        taskSpeedResultLabel.text = String(format: "%.0f", taskSpeedValue)
    }
    
    private func setConstraints() {
        taskSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskSpeedLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            taskSpeedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.taskSpeedLabelSideSpace),
            taskSpeedLabel.trailingAnchor.constraint(equalTo: taskSpeedSlider.leadingAnchor, constant: -Constants.taskSpeedLabelSideSpace)
        ])
        taskSpeedSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskSpeedSlider.centerYAnchor.constraint(equalTo: centerYAnchor),
            taskSpeedSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.taskSpeedSliderLeadingSpace),
            taskSpeedSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.taskSpeedSliderTrailingSpace)
        ])
        taskSpeedResultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskSpeedResultLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            taskSpeedResultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.taskSpeedResultLabelTrailingSpace),
        ])

    }
}
