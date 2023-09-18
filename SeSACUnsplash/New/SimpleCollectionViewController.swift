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
    
    let viewModel = SimpleViewModel()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<String, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.delegate = self
        
        configureDataSource()
        updateSnapshot()
        
        viewModel.list.bind { users in
            self.updateSnapshot()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.append()
        }
    }

    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<String, User>()
        snapshot.appendSections(["고래밥", "칙촉"])
        snapshot.appendItems(viewModel.list.value, toSection: "고래밥")
        snapshot.appendItems(viewModel.list2, toSection: "칙촉")
        
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

extension SimpleCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            viewModel.removeOneUser(index: indexPath.item)
//        }
//        updateSnapshot()
        
        // 다른화면으로 넘긴다면 값전달을 위해 indexPath 활용할 것 -> 런타임 에러 발생 가능성
//        let user = viewModel.list.value[indexPath.item]
        
        // 대신 아래와 같이 dataSource 활용
        guard let user = dataSource.itemIdentifier(for: indexPath) else {
            // 얼럿 등 대응
            return
        }
        
        dump(user)
    }
}

extension SimpleCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertUser(name: searchBar.text)
    }
}
