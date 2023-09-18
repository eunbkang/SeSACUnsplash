//
//  Observable.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import Foundation

class Observable<T> { // 어떤 타입이든 대응 가능(Generic)
    
    private var listener: ((T) -> Void)?
    
    var value: T { // value 바뀌면 클로저 실행
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) { // 프로퍼티(value)가 있으므로 초기화 필요
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listener = closure // 같은 타입의 함수를 넣어줌
    }
    
}
