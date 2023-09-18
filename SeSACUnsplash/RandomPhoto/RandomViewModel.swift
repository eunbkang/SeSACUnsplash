//
//  RandomViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/19.
//

import UIKit

final class RandomViewModel {
    
    var image = Observable(UIImage(systemName: "photo"))
    var description = Observable("")
    
    func callRandomPhoto() {
        guard let url = URL(string: Constants.BaseUrl.random) else { return }
        
        APIService.shared.callRequest(url: url, model: PhotoResult.self) { result in
            guard let result = result else { return }
            guard let url = URL(string: result.urls.small) else { return }
            self.description.value = result.alt_description ?? ""
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    self.image.value = UIImage(data: data)
                }
            }
        }
    }
}
