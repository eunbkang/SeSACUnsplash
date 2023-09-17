//
//  FocusMode.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/17.
//

import Foundation

struct FocusMode: Hashable {
    var title: String
    var detail: String
    var imageName: String
}

struct Modes {
    var list = [
        FocusMode(title: "방해 금지 모드", detail: "켬", imageName: "moon.fill"),
        FocusMode(title: "수면", detail: "", imageName: "bed.double.fill"),
        FocusMode(title: "업무", detail: "09:00 ~ 06:00", imageName: "clipboard.fill"),
        FocusMode(title: "개인 시간", detail: "설정", imageName: "person.fill")
    ]
}
