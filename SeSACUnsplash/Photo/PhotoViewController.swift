//
//  PhotoViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchPhoto()
        
        // list 데이터가 바뀌면 수행할 것(UI 관련된 것만)
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") else { return UITableViewCell()}
        
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.backgroundColor = .lightGray
        
        return cell
    }
}
