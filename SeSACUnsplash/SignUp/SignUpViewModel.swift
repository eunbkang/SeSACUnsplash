//
//  SignUpViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import Foundation

class SignUpViewModel {
    
    var email = Observable("")
    var password = Observable("")
    var nickname = Observable("")
    var location = Observable("")
    var code = Observable("")
    
    var isValid = Observable(false)
    var instructText = Observable("")
    
    func checkValidity() {
        if !validateEmail() {
            instructText.value = SignUpFieldType.email.instructText
            isValid.value = false
        } else if !validatePassword() {
            instructText.value = SignUpFieldType.password.instructText
            isValid.value = false
        } else if !validateNickname() {
            instructText.value = SignUpFieldType.nickname.instructText
            isValid.value = false
        } else if !valiadateCode() {
            instructText.value = SignUpFieldType.code.instructText
            isValid.value = false
        } else {
            instructText.value = ""
            isValid.value = true
            print("회원가입 가능")
        }
    }
    
    private func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email.value)
    }
    
    private func validatePassword() -> Bool {
        if password.value.count >= 6 && password.value.count <= 10 {
            return true
        } else {
            return false
        }
    }
    
    private func validateNickname() -> Bool {
        if nickname.value.count > 2 && nickname.value.count < 16 {
            return true
        } else {
            return false
        }
    }
    
    private func valiadateCode() -> Bool {
        if code.value.count > 0 {
            if Int(code.value) != nil && code.value.count == 6 {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}
