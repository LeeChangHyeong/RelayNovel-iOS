//
//  RelayProfileUserInfoView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileUserInfoView: UIView {
    private var startedNovelCount: Int?
    private var participatedNovelCount: Int?
    private var userName: String?
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28.0, weight: .medium)
        
        return label
    }()
    
    private lazy var startedNovelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "시작한 소설"
        
        return label
    }()
    
    private lazy var participatedNovelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "참여한 소설"
        
        return label
    }()
    
    private lazy var startedNovelCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var participatedNovelCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var textSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var novelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8.0
        
        textSeparatorView.snp.makeConstraints {
            $0.width.equalTo(1.0)
            $0.height.equalTo(18.0)
        }
        
        [
            startedNovelLabel,
            startedNovelCountLabel,
            textSeparatorView,
            participatedNovelLabel,
            participatedNovelCountLabel
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fetchUserData()
        configure()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayProfileUserInfoView {
    private func setupLayout() {
        [
            userNameLabel,
            novelStackView
        ].forEach { addSubview($0) }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        novelStackView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(12.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configure() {
        startedNovelCountLabel.text = "\(startedNovelCount ?? 0)"
        participatedNovelCountLabel.text = "\(participatedNovelCount ?? 0)"
        userNameLabel.text = userName
    }
    
    func fetchUserData() {
        // TestData
        startedNovelCount = 10
        participatedNovelCount = 4
        userName = "커리"
    }
}
