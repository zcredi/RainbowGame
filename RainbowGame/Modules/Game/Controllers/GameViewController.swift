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
    
    let wordOfGame = ["красный", "оранжевый", "жёлтый", "зелёный", "голубой", "синий", "фиолетовый"]
    let colorsOfGame = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.systemBlue, UIColor.blue, UIColor.purple]
    
    private lazy var textWithoutBackground: UILabel = {
        var label = UILabel()
        label.text = "красный" //
//MARK: функция модели получить рандомное слово
        label.numberOfLines = 0
        label.textColor = colorsOfGame.randomElement()
//MARK: функция модели получить рандомный цвет
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        
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
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    
    private lazy var backButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(backButtonPic, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var labelTimer: UILabel = {
        var label = UILabel()
        label.text = "00.06"
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var pauseButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(pauseButtonPic, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private func setView() {
        view.backgroundColor = UIColor.gray
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

        //backButton.addTarget(self, action: #selector(), for: .touchUpInside)
    }
    
    func setupLabelText1() {
        textWithoutBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        textWithoutBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        textWithBackground.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
//        textWithBackground.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor).isActive = true
       
    }
    func setupLabelText2() {
        textWithBackground.textAlignment = .center
        textWithBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        textWithBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textWithBackground.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textWithBackground.widthAnchor.constraint(equalToConstant: 205).isActive = true
        
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
