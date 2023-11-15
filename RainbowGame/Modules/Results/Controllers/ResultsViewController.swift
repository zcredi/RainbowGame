//
//  ResultsViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit
import SnapKit

class ResultsViewController: UIViewController {
    
    private let cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить статистику", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let element = UITableView()
        element.register(StatistickCell.self, forCellReuseIdentifier: "StatistickCell")
        element.separatorStyle = .none
        element.estimatedRowHeight = 80
        element.allowsSelection = false
        element.delegate = self
        element.dataSource = self
        element.backgroundColor = .clear
        return element
    }()
    
    private var statistick = Source.makeStatistick()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        setupViews()
        setupActions()
        makeCostrains()
    }

    func setupViews(){
        view.addSubview(cleanButton)
        view.addSubview(tableView)
    }
    
    func setupActions(){
        cleanButton.addTarget(self, action: #selector(cleanButtonAction), for: .touchUpInside)
    }
    
    func makeCostrains(){
        cleanButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().offset(53)
            make.trailing.equalToSuperview().inset(53)
            make.height.equalTo(63)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(cleanButton.snp.top)
        }
    }
    
    @objc func cleanButtonAction(){
        statistick.removeAll()
        tableView.reloadData()
        print("Нажата кнопка очистить статистику")
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statistick.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatistickCell", for: indexPath) as? StatistickCell else { fatalError() }
        
        cell.configureCell(statistick: statistick[indexPath.row])
        return cell
    }
    
    
}

extension ResultsViewController: UITableViewDelegate {

}
