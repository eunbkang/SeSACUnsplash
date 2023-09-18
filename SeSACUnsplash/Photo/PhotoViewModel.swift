//
//  PhotoViewModel.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    var numberOfRows: Int {
        return list.value.results.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results[indexPath.row]
    }
    
    func fetchPhoto(query: String) {
        guard let url = URL(string: Constants.BaseUrl.search + "\(query)") else { return }
        
        APIService.shared.callRequest(url: url, model: Photo.self) { photo in
            DispatchQueue.main.async {
                guard let photo = photo else { return }
                self.list.value = photo
            }
        }
    }
    
}
