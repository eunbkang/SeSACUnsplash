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
        return list.value.results?.count ?? 0
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }
    
    func fetchPhoto() {
        APIService.shared.searchPhoto(query: "cat") { photo in
            guard let photo = photo else { return }
            self.list.value = photo
        }
    }
    
}
