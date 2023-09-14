//
//  CalObservable.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/13.
//

import Foundation

class AdditionalObservable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            print("사용자 이름이 \(value)로 변경되었습니다.")
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ sample: @escaping (T) -> Void) {
        print("저는 \(value)입니다.")
        
        sample(value)
        listener = sample
    }
}
