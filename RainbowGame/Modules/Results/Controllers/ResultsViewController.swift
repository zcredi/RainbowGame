//
//  ResultsViewController.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit
import SnapKit

class ResultsViewController: UIViewController {
    
    //MARK: - Properties
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
    
    private lazy var emptyLabelSmaile: UILabel = {
        let label = UILabel()
        label.text = "😔"
        label.font = UIFont.systemFont(ofSize: 100)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var emptyLabel: UILabel = {
       let label = UILabel()
        label.text = "Тут ничего нет"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var viewForEmptyValue = UIView()
    
    private var statistick = [Statistick]()
    
    private let defaults = UserDefaults.standard
    

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Статистика"

        view.backgroundColor = .lightGray
        setupViews()
        setupActions()
        makeCostrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.statistick = Source.getArrayToUserDefaults()
        
        if statistick.isEmpty {
            viewForEmptyValue.isHidden = false
            cleanButton.isHidden = true
        }
        else {
            viewForEmptyValue.isHidden = true
            cleanButton.isHidden = false
        }
        
        tableView.reloadData()
    }

    //MARK: - Private func
    func setupViews(){
        view.addSubview(cleanButton)
        view.addSubview(tableView)
        view.addSubview(emptyLabelSmaile)
        view.addSubview(viewForEmptyValue)
        viewForEmptyValue.addSubview(emptyLabelSmaile)
        viewForEmptyValue.addSubview(emptyLabel)
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
        
        emptyLabelSmaile.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyLabelSmaile.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        viewForEmptyValue.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    //MARK: - objc func
    @objc func cleanButtonAction(){
        statistick.removeAll()
        tableView.reloadData()
        defaults.removeObject(forKey: "StatistickArray")
        print("Нажата кнопка очистить статистику")
        cleanButton.isHidden = true
        viewForEmptyValue.isHidden = false
    }
}

    //MARK: - Extension
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
