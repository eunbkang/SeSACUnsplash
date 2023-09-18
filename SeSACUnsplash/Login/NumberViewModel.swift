//
//  NumberViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import Foundation

class NumberViewModel {
    
    // label에 보여줄 것, textField에 보여줄 것
    var number: Observable<String?> = Observable("1")
    var result = Observable("KRW1,327 입니다.")
    
    
    func convertNumber() {
        
        // 입력값 확인: 빈 값, 문자열, 백만원 내에서 가능
        guard let text = number.value else {
            result.value = "값을 입력하세요."
            return
        }
        guard let textToNumber = Int(text) else {
            result.value = "100만달러 이하의 숫자를 입력하세요."
            return
        }
        guard textToNumber > 0, textToNumber <= 1000000 else {
            result.value = "환율 계산 범위는 0~100만달러입니다."
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let decimalNumber = numberFormatter.string(for: textToNumber * 1327)!
        
        result.value = "KRW\(decimalNumber) 입니다."
    }
}
