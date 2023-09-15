//
//  SimpleCollectionViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/14.
//

import UIKit
import SnapKit

class SimpleCollectionViewController: UIViewController {
    
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // UICollectionView.CellRegistration, iOS 14+, 메서드 대신 제네릭 사용. 생 생성시마다 클로저 호출
        cellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            // 셀 디자인, 데이터 처리 등 이루어짐
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "star.fill")
            
            content.imageProperties.tintColor = .systemYellow
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 24
            
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .systemGray5
            backgroundConfig.cornerRadius = 12
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemPurple
            
            cell.backgroundConfiguration = backgroundConfig
        })
    }
    
    static func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemTeal
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}

extension SimpleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])

        return cell
    }
}

