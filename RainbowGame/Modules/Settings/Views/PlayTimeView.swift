//
//  PlayTimeView.swift
//  RainbowGame
//
//  Created by Andrei Shpartou on 15/11/2023.
//

import UIKit

class PlayTimeView: UIView {
    private enum Constants {
        static let playTimeLabelSideSpace: CGFloat = 5.0
        static let playTimeSliderTrailingSpace: CGFloat = -40.0
        static let playTimeSliderLeadingSpace: CGFloat = 140.0
        static let playTimeResultLabelTrailingSpace: CGFloat = -10.0
    }
    
    private lazy var playTimeLabel: UILabel = {
        let label = UILabel()        
        label.font = .systemFont(ofSize: 15)
        label.text = "время игры, мин"
        label.textColor = .black
        return label
    }()
    
    private lazy var playTimeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.tintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        slider.isContinuous = true
        slider.addTarget(nil, action: #selector(SettingsViewController.playTimeSliderChanged), for: .valueChanged)
        return slider
    }()
    
    lazy var playTimeResultLabel: UILabel = {
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
        addSubview(playTimeLabel)
        addSubview(playTimeSlider)
        addSubview(playTimeResultLabel)
    }
    
    private func setupSettings() {
        let settingsManager = SettingsManager()
        let playTimeValue = settingsManager.get(forKey: .playTime) as! Float
        playTimeSlider.value = playTimeValue
        playTimeResultLabel.text = String(format: "%.0f", playTimeValue)        
    }
    
    private func setConstraints() {
        playTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playTimeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            playTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.playTimeLabelSideSpace),
            playTimeLabel.trailingAnchor.constraint(equalTo: playTimeSlider.leadingAnchor, constant: -Constants.playTimeLabelSideSpace)
        ])
        playTimeSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playTimeSlider.centerYAnchor.constraint(equalTo: centerYAnchor),
            playTimeSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.playTimeSliderLeadingSpace),
            playTimeSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.playTimeSliderTrailingSpace)
        ])
        playTimeResultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playTimeResultLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            playTimeResultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.playTimeResultLabelTrailingSpace),
        ])
       
    }
}
