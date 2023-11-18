//
//  MainViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addTarget()
    }
    
    //MARK: - Private Methods
    
    private func addTarget(){
        mainView.startButtonGame.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        mainView.statisticsButtonGame.addTarget(self, action: #selector(statisticsButtonTapped), for: .touchUpInside)
        mainView.settingsButtonGame.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        mainView.questionsButtonGame.addTarget(self, action: #selector(qusButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - objc Methods
    
    @objc private func startButtonTapped(){
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc private func statisticsButtonTapped(){
        let statisticsVC = ResultsViewController()
        navigationController?.pushViewController(statisticsVC, animated: true)
    }
    
    @objc private func settingsButtonTapped(){
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc private func qusButtonTapped(){
        let questionsVC = RulesViewController()
        navigationController?.pushViewController(questionsVC, animated: true)
    }
}
