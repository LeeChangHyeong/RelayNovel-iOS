//
//  RelayBrowsingHeaderView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class RelayBrowsingHeaderView: UIView {
    private lazy var entireTitleView = BrowsingTitleView(frame: .zero, title: "전체")
    private lazy var runningTitleView = BrowsingTitleView(frame: .zero, title: "달리는중")
    private lazy var completedTitleView = BrowsingTitleView(frame: .zero, title: "완주")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution =. equalSpacing
        stackView.spacing = 16.0
        
        [
            entireTitleView,
            runningTitleView,
            completedTitleView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var relayListView = RelayListView(frame: .zero, type: .browse)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
