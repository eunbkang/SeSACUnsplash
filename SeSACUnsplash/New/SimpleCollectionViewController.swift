//
//  SimpleCollectionViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/14.
//

import UIKit
import SnapKit

class SimpleCollectionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 1000
        case second = 5
    }
    
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    var list2 = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Man", age: 23),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<String, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()
        
        var snapshot = NSDiffableDataSourceSnapshot<String, User>()
        snapshot.appendSections(["고래밥", "칙촉"])
        snapshot.appendItems(list, toSection: "고래밥")
        snapshot.appendItems(list2, toSection: "칙촉")
        
        dataSource.apply(snapshot) // 필요한 시점에 apply
    }
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemTeal
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
//         let cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
        
        // UICollectionView.CellRegistration, iOS 14+, 메서드 대신 제네릭 사용. 생 생성시마다 클로저 호출
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User>(handler: { cell, indexPath, itemIdentifier in
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
        
        // dataSource 초기화. CellForItemAt 대체
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

//extension SimpleCollectionViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
//
//        return cell
//    }
//}
