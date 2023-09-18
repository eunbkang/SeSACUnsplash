//
//  SignUpViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private let signUpView = SignUpView()
    private var viewModel = SignUpViewModel()
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTargetToTextFields()
        
        viewModel.isValid.bind { bool in
            self.signUpView.signUpButton.isEnabled = bool
            self.signUpView.signUpButton.backgroundColor = bool ? .white : .systemGray4
        }
        
        viewModel.instructText.bind { text in
            self.signUpView.instructLabel.text = text
        }
    }
    
    private func addTargetToTextFields() {
        signUpView.emailTextField.addTarget(self, action: #selector(changedEmailTextField), for: .editingChanged)
        signUpView.passwordTextField.addTarget(self, action: #selector(changedPasswordTextField), for: .editingChanged)
        signUpView.nicknameTextField.addTarget(self, action: #selector(changedNicknameTextField), for: .editingChanged)
        signUpView.locationTextField.addTarget(self, action: #selector(changedLocationTextField), for: .editingChanged)
        signUpView.codeTextField.addTarget(self, action: #selector(changedCodeTextField), for: .editingChanged)
    }
    
    @objc func changedEmailTextField() {
        guard let text = signUpView.emailTextField.text else { return }
        viewModel.email.value = text
        viewModel.checkValidity()
    }
    @objc func changedPasswordTextField() {
        guard let text = signUpView.passwordTextField.text else { return }
        viewModel.password.value = text
        viewModel.checkValidity()
    }
    @objc func changedNicknameTextField() {
        guard let text = signUpView.nicknameTextField.text else { return }
        viewModel.nickname.value = text
        viewModel.checkValidity()
    }
    @objc func changedLocationTextField() {
        guard let text = signUpView.locationTextField.text else { return }
        viewModel.location.value = text
        viewModel.checkValidity()
    }
    @objc func changedCodeTextField() {
        guard let text = signUpView.codeTextField.text else { return }
        viewModel.code.value = text
        viewModel.checkValidity()
    }
}
