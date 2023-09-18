//
//  RandomViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/19.
//

import UIKit

final class RandomViewController: UIViewController {
    
    private let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("random photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        
        return button
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray6
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    private let viewModel = RandomViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configViewComponents()
        configLayoutConstraints()
        
        randomButton.addTarget(self, action: #selector(tappedRandomButton), for: .touchUpInside)
        
        viewModel.image.bind { image in
            self.imageView.image = image
        }
        
        viewModel.description.bind { text in
            self.descriptionLabel.text = text
        }
    }
    
    @objc func tappedRandomButton() {
        viewModel.callRandomPhoto()
    }
    
    private func configViewComponents() {
        view.addSubview(randomButton)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
    }
    
    private func configLayoutConstraints() {
        randomButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(48)
        }
        
        imageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(0.75)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(16)
        }
    }
}
