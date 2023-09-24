//
//  Beer.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/25.
//

import Foundation

struct Beer: Decodable {
    let id: Int
    let name: String?
    let tagline: String?
    let first_brewed: String?
    let description: String?
    let image_url: String?
    let food_pairing: [String]?
}
