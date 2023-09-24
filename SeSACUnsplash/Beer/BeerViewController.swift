//
//  BeerViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/25.
//

import UIKit
import SnapKit
import Kingfisher

final class BeerViewController: UIViewController {
    
    private let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    let viewModel = BeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configHierarchy()
        configLayout()
        
        randomButton.addTarget(self, action: #selector(tappedRandomButton), for: .touchUpInside)
        
        viewModel.beer.bind { beer in
            self.nameLabel.text = beer.name
            
            if let imageUrl = beer.image_url {
                self.imageView.kf.setImage(with: URL(string: imageUrl))
            }
        }
    }
    
    @objc func tappedRandomButton() {
        viewModel.callRandomBeer()
    }
    
    private func configHierarchy() {
        view.addSubview(randomButton)
        view.addSubview(nameLabel)
        view.addSubview(imageView)
    }
    
    private func configLayout() {
        randomButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(randomButton.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.size.equalTo(250)
            make.centerX.equalToSuperview()
        }
    }
}
