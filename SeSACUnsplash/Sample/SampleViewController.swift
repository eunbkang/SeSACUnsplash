//
//  SampleViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import UIKit

class User: Hashable {
    let id = UUID().uuidString // Unique. name, age가 같더라도 문제가 생기지 않게
    
    let name: String
    let age: Int
    
    var intro: String {
        return "\(name), \(age)세"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Equatable 속성에 대한 대응
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // id를 기준으로 고유성을 판별하겠다
    }
}

class SampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number1 = 10
        var number2 = 3
        
        print(number1 - number2)
        
        number1 = 3
        number2 = 1
        
        var number3 = Observable(10)
        var number4 = Observable(3)
        
        // number는 number3의 value
        number3.bind { number in
            print("Observable", number3.value - number4.value)
        }
        
        // value 변경 -> didSet 호출 -> listener에 넣어놓은 위의 함수 실행됨
        number3.value = 100
        number3.value = 500
        number3.value = 50
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SampleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell") else { return UITableViewCell() }
//        let data = viewModel.cellForFowAt(at: indexPath)
        // 레이블에 보여지는 글자는 모델의 연산프로퍼티(호출될때 메모리에 올라감)로 구성
        // 뷰컨트롤러에서 데이터 가공하지 않기 위함
//        cell.textLabel?.text = data.intro
        
        let cell = UITableViewCell() // 클래스이므로 let으로 선언
        
        var content = cell.defaultContentConfiguration() // 구조체이므로 var로 선언
        content.text = "content configuration" // 이전의 textLabel
        content.secondaryText = "secondary text \(indexPath.row)" // 이전의 detailTextLabel
        
        cell.contentConfiguration = content
        
        return cell
    }
}
