//
//  MainViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupResumeGame()
        view = mainView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupResumeGame()
    }
    
    private func setupButtons() {
        mainView.startButtonGame.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        mainView.settingsButtonGame.addTarget(self, action: #selector(presentSettings), for: .touchUpInside)
        mainView.statisticsButtonGame.addTarget(self, action: #selector(presentStatistics), for: .touchUpInside)
        mainView.questionsButtonGame.addTarget(self, action: #selector(presentRules), for: .touchUpInside)
        mainView.resumeButtonGame.addTarget(self, action: #selector(resumeGame), for: .touchUpInside)
    }
    
    private func setupResumeGame() {
        guard let time = UserDefaults.standard.object(forKey: "timerForContinue") as? Int else {
            mainView.resumeButtonGame.backgroundColor = .lightGray
            mainView.resumeButtonGame.isUserInteractionEnabled = false
            return
        }
        if time == 0 {
            mainView.resumeButtonGame.backgroundColor = .lightGray
            mainView.resumeButtonGame.isUserInteractionEnabled = false
        } else {
            mainView.resumeButtonGame.backgroundColor = UIColor(named: "resumeButtonColor")
            mainView.resumeButtonGame.isUserInteractionEnabled = true
        }
        
    }
    
    @objc func startGame() {
        let vc = GameViewController()
        UserDefaults.standard.set(vc.gameModel.timeOfGame * 60, forKey: "timerForContinue")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func presentStatistics() {
        self.navigationController?.pushViewController(ResultsViewController(), animated: true)
    }
    
    @objc func presentSettings() {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    @objc func presentRules() {
        self.navigationController?.pushViewController(RulesViewController(), animated: true)
    }
    
    @objc func resumeGame() {
        self.navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
}
