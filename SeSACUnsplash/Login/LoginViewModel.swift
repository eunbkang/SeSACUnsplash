//
//  LoginViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import Foundation

class LoginViewModel {
    
    var id = Observable("")
    var pw = Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completion: @escaping () -> Void) {
        // 서버 통신, 닉네임/id 저장
        UserDefaults.standard.set(id.value, forKey: "id")
        
        completion()
    }
}
