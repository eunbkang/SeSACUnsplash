//
//  BeerViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/25.
//

import Foundation

final class BeerViewModel {
    
    var beer = Observable(Beer(id: 0, name: "", tagline: "", first_brewed: "", description: "", image_url: "", food_pairing: []))
    
    func callRandomBeer() {
        Network.shared.callRequest(type: [Beer].self, api: .random) { response in
            switch response {
            case .success(let data):
                dump(data)
                self.beer.value = data[0]
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
