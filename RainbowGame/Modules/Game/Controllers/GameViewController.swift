//
//  GameViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    let backButtonPic = UIImage(named: "backButton")
    let pauseButtonPic = UIImage(named: "pauseButton")
    var timer = Timer()
    
    let wordOfGame = ["красный", "оранжевый", "жёлтый", "зелёный", "голубой", "синий", "фиолетовый"]
    let colorsOfGame = [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple]
    
    private lazy var textWithoutBackground: UILabel = {
        var label = UILabel()
        label.text = "красный" //
//MARK: функция модели получить рандомное слово
        label.numberOfLines = 0
        label.textColor = colorsOfGame.randomElement()
//MARK: функция модели получить рандомный цвет
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var textWithBackground: UILabel = {
        var label = UILabel()
        label.text = "красный"
//MARK: функция модели получить рандомное слово
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.backgroundColor = colorsOfGame.randomElement()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    
    private lazy var backButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(backButtonPic, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var time = 65
    
    private lazy var labelTimer: UILabel = {
        var label = UILabel()
        label.text = "\(makeTimeString(seconds: time))"
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.monospacedSystemFont(ofSize: 30, weight: UIFont.Weight.regular)
        // такой шрифт чтоб таймер не дергался при обновлении когда цифры имеют разную ширину
        
        return label
    }()
    
    private lazy var pauseButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(pauseButtonPic, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private func setView() {
        view.backgroundColor = UIColor.systemGray5
    }
    
    private func setupBackButton() {
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true

        //backButton.addTarget(self, action: #selector(), for: .touchUpInside)
    }
    
    func setupLabelTimer() {
        labelTimer.textAlignment = .center
        labelTimer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        labelTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTimer.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
        labelTimer.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor).isActive = true
        labelTimer.bottomAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
    }
    
    private func setupPauseButton() {
        pauseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        pauseButton.bottomAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
        pauseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        pauseButton.addTarget(self, action: #selector(deleteTimer), for: .touchUpInside)
    }
    
    private func setupLabelText1() {
        textWithoutBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        textWithoutBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        textWithBackground.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
//        textWithBackground.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor).isActive = true
       
    }
    private func setupLabelText2() {
        textWithBackground.textAlignment = .center
        textWithBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        textWithBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textWithBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textWithBackground.widthAnchor.constraint(equalToConstant: 205).isActive = true
        
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(tickTimer),
            userInfo: nil,
            repeats: true)
    }
    @objc private func deleteTimer() {
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(backButton)
        view.addSubview(labelTimer)
        view.addSubview(pauseButton)
        view.addSubview(textWithoutBackground)
        view.addSubview(textWithBackground)
        
        
        
        setView()
        setupBackButton()
        setupLabelTimer()
        setupPauseButton()
        setupLabelText1()
        setupLabelText2()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    func makeTimeString(seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", seconds / 60)
        timeString += ":"
        timeString += String(format: "%02d", seconds % 60)
        return timeString
    }
    
    @objc func tickTimer() {
        time -= 1
        textWithBackground.backgroundColor = colorsOfGame.randomElement()
        if time == 0 {
            timer.invalidate()
        }
//        makeTimeString(seconds: time)
        
        labelTimer.text = "\(makeTimeString(seconds: time))"
        
//        var minutes = time / 60
//        var seconds = time % 60
//        if minutes > 10 {
//            if seconds > 10 {
//                labelTimer.text = "\(minutes):\(seconds)"
//            } else {
//                labelTimer.text = "\(minutes):0\(seconds)"
//            }} else {
//                if seconds > 10 {
//                    labelTimer.text = "0\(minutes):\(seconds)"
//                } else {
//                    labelTimer.text = "0\(minutes):0\(seconds)"
//                }
//            }
//        "\(time / 60):\(time % 60)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
