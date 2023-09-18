//
//  SignUpView.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 28, weight: .black)
        label.text = "JACKFLIX"
        
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    let nicknameTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    let locationTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    let codeTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        return button
    }()
    
    let instructLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemRed
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField, signUpButton, instructLabel])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 16
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViewComponents()
        configLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViewComponents() {
        configTextFields()
        
        addSubview(titleLabel)
        addSubview(stackView)
    }
    
    private func configLayoutConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(36)
        }
    }
    
    private func configTextFields() {
        configTextField(emailTextField, placeholder: SignUpFieldType.email.placeholder, type: .emailAddress)
        configTextField(passwordTextField, placeholder: SignUpFieldType.password.placeholder, isSecure: true)
        configTextField(nicknameTextField, placeholder: SignUpFieldType.nickname.placeholder)
        configTextField(locationTextField, placeholder: SignUpFieldType.location.placeholder)
        configTextField(codeTextField, placeholder: SignUpFieldType.code.placeholder)
    }
    
    private func configTextField(_ textField: UITextField, placeholder: String, type: UIKeyboardType = .default, isSecure: Bool = false) {
        textField.keyboardType = type
        textField.isSecureTextEntry = isSecure
        textField.textColor = .white
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 15, weight: .semibold)
        textField.backgroundColor = .darkGray
        textField.borderStyle = .roundedRect
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 15, weight: .semibold)
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
