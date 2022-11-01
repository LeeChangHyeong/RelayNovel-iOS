//
//  RelayListCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit
import SnapKit

class RelayListCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .white
        
        label.clipsToBounds = true
        label.backgroundColor = .systemPink
        label.layer.cornerRadius = 12.0
        
        return label
    }()
    
    private lazy var stepCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var relayTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        
        return label
    }()
    
    private lazy var bgmTagLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var creationTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var heartCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .systemPink
        
        return label
    }()
}

extension RelayListCollectionViewCell {
    func configure() {
        statusLabel.text = "달리는중"
        stepCountLabel.text = "8/20 터치"
        relayTitleLabel.text = "릴레이 소설 제목입니다"
        bgmTagLabel.text = "􀑪 #판타지 #모험 #대항해시대 #해적 #극적인"
        creationTimeLabel.text = "1일 전"
        heartCountLabel.text = "􀊵 17"
        
        setupLayout()
    }
    
    private func setupLayout() {
        [
            statusLabel,
            stepCountLabel,
            relayTitleLabel,
            bgmTagLabel,
            creationTimeLabel,
            heartCountLabel
        ].forEach { addSubview($0) }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        stepCountLabel.snp.makeConstraints {
            $0.leading.equalTo(statusLabel.snp.trailing).offset(5.0)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }
        
        relayTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(statusLabel.snp.leading)
            $0.top.equalTo(statusLabel.snp.bottom).offset(8.0)
        }
        
        bgmTagLabel.snp.makeConstraints {
            $0.leading.equalTo(statusLabel.snp.leading)
            $0.top.equalTo(relayTitleLabel.snp.bottom).offset(10.0)
            
        }
        
        creationTimeLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20.0)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }
        
        heartCountLabel.snp.makeConstraints {
            $0.trailing.equalTo(creationTimeLabel.snp.trailing)
            $0.centerY.equalTo(bgmTagLabel.snp.centerY)
        }
    }
}
