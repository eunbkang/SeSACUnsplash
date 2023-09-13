//
//  SampleViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import Foundation

class SampleViewModel {
    // 뷰에 보여질 데이터를 최대한 가공해주는 역할
    
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellForFowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
    
}
