//
//  StatistickCell.swift
//  RainbowGame
//
//  Created by Admin on 13.11.2023.
//

import UIKit
import SnapKit

class StatistickCell: UITableViewCell{
    
    private lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let gameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .purple
        label.text = "Игра №"
        return label
    }()
    
    private let timeLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Время "
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        self.backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(background)
        background.addSubview(gameLabel)
        background.addSubview(timeLabel)
        
        background.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        gameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(9)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(gameLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(9)
            make.bottom.equalToSuperview().inset(12)
        }
    }
    
    func configureCell(statistick:Statistick){
        gameLabel.text = "Игра № \(statistick.gameNomer)"
        timeLabel.text = "Время \(statistick.time)"
    }
}
