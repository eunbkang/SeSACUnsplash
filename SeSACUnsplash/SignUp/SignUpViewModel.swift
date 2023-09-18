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
        
    }
}
