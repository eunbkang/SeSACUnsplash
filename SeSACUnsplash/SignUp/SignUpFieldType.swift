//
//  SignUpFieldType.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import Foundation

enum SignUpFieldType {
    case email
    case password
    case nickname
    case location
    case code
    
    var placeholder: String {
        switch self {
        case .email:
            return "이메일 주소"
        case .password:
            return "비밀번호"
        case .nickname:
            return "닉네임"
        case .location:
            return "위치"
        case .code:
            return "추천 코드 입력"
        }
    }
    
    var instructText: String {
        switch self {
        case .email:
            return "이메일 주소 형식에 맞게 입력하세요."
        case .password:
            return "비밀번호는 6자 이상, 10자 이하로 설정하세요."
        case .nickname:
            return "닉네임은 2자 이상, 16자 이하로 설정하세요."
        case .location:
            return ""
        case .code:
            return "추천코드는 숫자 6자리로 입력하세요."
        }
    }
}
