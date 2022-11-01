//
//  RelayListView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayListView: UIView {
    private var listHeaderView: RelayListHeaderView?
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    init(frame: CGRect, type: ViewType) {
        super.init(frame: frame)
        
        setRelayListHeaderView(type)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayListView: UICollectionViewDelegateFlowLayout {
    
}

extension RelayListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }

}

extension RelayListView {
    enum ViewType {
        case browse
        case started
        case participated
        case like
    }
    
    private func setupLayout() {
        guard let listHeaderView = listHeaderView else { return }
        
        [
            listHeaderView,
            listCollectionView
        ].forEach { addSubview($0) }
        
        listHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60.0)
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(listHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setRelayListHeaderView(_ viewType: ViewType) {
        switch viewType {
        case .browse:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .browse)
        case .like:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .like)
        case .started:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .started)
        case .participated:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .participated)
        }
    }
}
