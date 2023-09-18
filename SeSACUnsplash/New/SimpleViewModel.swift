//
//  SimpleViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/18.
//

import Foundation

class SimpleViewModel {
    
    let list: Observable<[User]> = Observable([])
    
    var list2 = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Man", age: 23),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    func append() {
        list.value = [
            User(name: "Hue", age: 23),
            User(name: "Hue", age: 23),
            User(name: "Jack", age: 21),
            User(name: "Bran", age: 20),
            User(name: "Kokojong", age: 20)
        ]
    }
    
    func remove() {
        list.value = []
    }
    
    func removeOneUser(index: Int) {
        list.value.remove(at: index)
    }
    
    func insertUser(name: String?) {
        guard let text = name else { return }
        let user = User(name: text, age: Int.random(in: 20...50))
        list.value.insert(user, at: Int.random(in: 0...2))
    }
}
