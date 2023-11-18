//
//  GameViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    
    var gameModel = GameModel(timerCounting: false)
    let boundsx = UIScreen.main.bounds.width
    let boundsy = UIScreen.main.bounds.height
    
    var timer = Timer()
    var timer2 = Timer()
    let rc = ResultsViewController()
    
    let config = UIImage.SymbolConfiguration(pointSize: 20)
    
    private func setUpNavigation() {
        
        self.navigationController!.navigationBar.titleTextAttributes = [
            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: UIFont.Weight.black)]
//        self.navigationController?.navigationBar.topItem?.title = [
//            .font: UIFont.monospacedSystemFont(ofSize: 20, weight: UIFont.Weight.regular)]
        navigationItem.title = "\(makeTimeString(seconds: gameModel.time))"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: gameModel.timerCounting ? "play.fill" : "pause.fill", withConfiguration: config), style: .plain, target: self, action: #selector(startStopTapped))
    }
 
    private func setView() {
        view.backgroundColor = .systemGray6
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(tickTimer),
            userInfo: nil,
            repeats: true)
    }
    
    @objc private func startStopTapped() {
        if(gameModel.timerCounting) {
            gameModel.timerCounting = false
            timer.invalidate()
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "play.fill" ), style: .plain, target: self, action: #selector(startStopTapped))
//            setUpNavigation()
        } else {
            gameModel.timerCounting = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pause.fill" ), style: .plain, target: self, action: #selector(startStopTapped))
//            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: gameModel.timerCounting ? "play.fill" : "pause.fill", withConfiguration: config))
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(tickTimer),
                userInfo: nil,
                repeats: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel.time = getTimeForContinue()
        setUpNavigation()
        setView()
    }
    
    func goTimer() {
        timer2 = Timer.scheduledTimer(timeInterval: gameModel.timeInterval, target: self, selector: #selector(pokazSlov), userInfo: nil, repeats: true)
    }
    
    @objc func pokazSlov() {
        let i = gameModel.wordNumber
        if gameModel.timerCounting {
            let word = makeText(i)
            view.addSubview(word)
            setupWord(label: word, index: i)
            DispatchQueue.main.asyncAfter(deadline: .now() + gameModel.timeInterval) {
                self.removeView(view: word)
            }
            if gameModel.wordNumber < 6 {
                gameModel.wordNumber += 1
            } else {
                gameModel.wordNumber = 0
            }
        }
    }
    
    func removeView(view: UIView){
        view.removeFromSuperview()
    }
    
    func makeText(_ i : Int) -> UILabel {
        let label = UILabel()
        label.text = gameModel.getWord(i) //
        //MARK: функция модели получить рандомное слово
        label.textColor = gameModel.getColor(i)
        label.numberOfLines = 0
        label.backgroundColor = gameModel.getBackgroundColor(i)
        label.layer.cornerRadius = CGFloat(Int(boundsy / 15)/2)
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont( ofSize: gameModel.backgroundForText ? CGFloat(Int(boundsy / 15)/2) : CGFloat(Int(boundsy / 25)) )
        return label
    }
    
    func setupWord(label: UILabel, index: Int) {
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(CGFloat(Int(boundsy / 4)) + CGFloat((Int(boundsx) / 5) * index))).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(Int.random(in: 0...Int(boundsx/2.6)))).isActive = true
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: CGFloat(Int(boundsy / 15))).isActive = true
        label.widthAnchor.constraint(equalToConstant: CGFloat(Int(boundsy / 4))).isActive = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
        gameModel.timerCounting = true
        goTimer()
        
    }
    func makeTimeString(seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", seconds / 60)
        timeString += ":"
        timeString += String(format: "%02d", seconds % 60)
        return timeString
    }
    
    @objc func tickTimer() {
        gameModel.time -= 1
        if gameModel.time == 0 {
            timer.invalidate()
            timer2.invalidate()
            goToResult()
        }
        navigationItem.title = "\(makeTimeString(seconds: gameModel.time))"
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(gameModel.time, forKey: "timerForContinue")
        timer.invalidate()
        timer2.invalidate()
        gameModel.time = gameModel.timeOfGame
        
        //        self.navigationController?.pushViewController(rc, animated: true)
    }
    @objc func goToResult() {
        self.navigationController?.pushViewController(rc, animated: true)
    }
    
    private func getTimeForContinue() -> Int {
        guard let time = UserDefaults.standard.object(forKey: "timerForContinue") as? Int else {
            return gameModel.timeOfGame * 60
        }
        if time == 0 {
            return gameModel.timeOfGame * 60
        } else {
            return time
        }
    }
}

