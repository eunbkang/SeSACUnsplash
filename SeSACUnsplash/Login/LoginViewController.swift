//
//  LoginViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(changedIdTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(changedPwTextField), for: .editingChanged)
        
        // id가 바뀔때마다 textfield에 값 보여줌
        viewModel.id.bind { text in
            print("Bind ID \(text)")
            self.idTextField.text = text
        }
        
        viewModel.pw.bind { text in
            print("Bind PW \(text)")
            self.passwordTextField.text = text
        }
        
        viewModel.isValid.bind({ bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        })
        
    }
    
    @objc func changedIdTextField() {
        print(#function)
        
        // 뷰모델에 데이터를 업데이트해줌
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func changedPwTextField() {
        viewModel.pw.value = passwordTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func tappedLoginButton() {
        // 유효성 검증은 viewModel에서 수행
        
        viewModel.signIn {
            print("로그인 성공 얼럿, 화면전환 등 UI 관련")
        }
    }
}
