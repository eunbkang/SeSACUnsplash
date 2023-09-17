//
//  FocusModeViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/17.
//

import UIKit
import SnapKit

final class FocusModeViewController: UIViewController {
    
    var data = Modes().list
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configCollectionViewLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Int, FocusMode>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "집중 모드"
        configViewComponents()
        
        configureCellAndDataSource()
        applySnapShot()
    }
    
    private func applySnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, FocusMode>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        
        dataSource.apply(snapshot)
    }
    
    private func configureCellAndDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, FocusMode> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.detail
            content.image = UIImage(systemName: itemIdentifier.imageName)
            
            let cellItem = FocusModeType.allCases[indexPath.item]
            content.imageProperties.tintColor = cellItem.color
            
            if cellItem == .work {
                content.prefersSideBySideTextAndSecondaryText = false
            } else {
                content.prefersSideBySideTextAndSecondaryText = true
            }
            
            cell.contentConfiguration = content
            cell.accessories = [UICellAccessory.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
    }
    
    private func configViewComponents() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    static private func configCollectionViewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}
