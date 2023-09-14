//
//  CalculateViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/13.
//

import Foundation

class CalculateViewModel {
    
    var firstNumber: AdditionalObservable<String?> = AdditionalObservable("10")
    var secondNumber: AdditionalObservable<String?> = AdditionalObservable("20")
    
    var resultText = AdditionalObservable("결과는 30입니다.")
    
    var tempText = AdditionalObservable("테스트 텍스트!")
    
    // 연산, 빈값 옵셔널, 더하기, 오류, 결과 등등
    // -> 비즈니스로직
    func calculate() {
        guard let first = firstNumber.value, let firstConvertedNo = Int(first) else {
            resultText.value = "첫번째 숫자 오류"
            return
        }
        guard let second = secondNumber.value, let secondConvertedNo = Int(second) else {
            resultText.value = "첫번째 숫자 오류"
            return
        }
        
        
        resultText.value = "결과는 \(firstConvertedNo + secondConvertedNo)입니다."
    }
    
    func presentNumberFormat() {
        guard let first = firstNumber.value, let firstConvertedNo = Int(first) else {
            tempText.value = "숫자로 변환할 수 없는 문자입니다."
            return
        }
        tempText.value = format(for: firstConvertedNo)
    }
    
    // 로또 과제를 위한 함수
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
}
