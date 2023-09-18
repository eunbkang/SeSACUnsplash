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
            return "이메일 주소 또는 전화번호"
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
}
