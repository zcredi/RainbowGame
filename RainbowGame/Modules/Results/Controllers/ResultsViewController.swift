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
//        element.register(ChannelViewCell.self, forCellReuseIdentifier: ChannelViewCell.reuseID)
        element.separatorStyle = .none
        element.rowHeight = UITableView.automaticDimension
        element.estimatedRowHeight = 80
//        element.delegate = self
//        element.dataSource = self
        return element
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        setupViews()
        makeCostrains()
    }

    func setupViews(){
        view.addSubview(cleanButton)
        view.addSubview(tableView)
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
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(cleanButton.snp.top)
        }
    }
}
