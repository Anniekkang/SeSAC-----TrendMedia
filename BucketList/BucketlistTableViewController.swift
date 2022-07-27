//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

struct Todo {
    
    var title : String
    var done : Bool
    
}

class BucketlistTableViewController: UITableViewController {


    static let identifier = "BucketlistTableViewController"
    
    
    //1. 값전달을 받기 위한 공간

    var textfieldPlaceholder : String?{
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
        }
    }
    //옵셔널 스트링 타입으로 선언하더라도 오류가 뜨지 않는 이유는?
    //placeholder 자체가 옵셔널 이라면?
    //하지만 String interpolation 이라면?
    
    //list 프로퍼티가 추가, 삭제 등 변경 되고 나서 테이블뷰를 항상 갱신
    //ui적인 요소들은 거의 클래스, 필요한 시점에 didSet이 "한번만" 호출되서 걱정 노노, 아울렛을 쓸땐 용이함
    //클래스는 ref타입 -> 인스턴스 자체를 변경하지 않는 이상 한번만 호출됨(특정 클래스를 통으로 바꾸는 것)
    //IBOulet ViewDidLoad 호출 되기 직전에 nil이 아닌지 긴지 알 수 있음
    
    //딕셔너리로 값을 관리?key는 중복이될 수 없음 so key : "darkknight" 불가!, and 순서가 없어서 사용하면 안됨 (indexPath.row를 사용못함)
    
    @IBOutlet weak var userTextField: UITextField!
    var list = [Todo(title: "darkknight", done: false), Todo(title: "topgun", done: false)]{
        didSet {
    
            
            tableView.reloadData() //
            print("list changed, \(list),\(oldValue)") // 바뀔때마다 호출?
        }
    }
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. 값전달
        userTextField.text = ""
        userTextField.placeholder = "\(textfieldPlaceholder ?? "영화")를 입력해주시오"
        
        
        
        navigationItem.title = "Title"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        
        
//        list.append("starwars")
//        list.append("minari")
    }
    
   @objc func closeButtonTapped(){
       self.dismiss(animated: true)
    }
    
    @IBAction func userTextFieldEnterTapped(_ sender: UITextField) {
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
//            list.append(userTextField.text!)
//            //중요한 코드!,tableview를 다시그려달라
//            tableView.reloadData()
//        } else {
//            //토스트 메세지 띄우기
//        }
//
//        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else { return } //alert, Toast를 통해서 빈칸을 입력했다는 등의 안내를 해야함
        
        list.append(Todo(title: userTextField.text!, done: false))
//        tableView.reloadData() //
//
       
        
        //tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
                    }
    
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketlistTableViewController.identifier, for: indexPath) as! BuketlistTableViewCell //as? 타입캐스팅
        
            cell.bucketlistLabel.text = list[indexPath.row].title
            
      
        //tag값과 row값이 동일
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(checkBoxButtonClicked), for: .touchUpInside)
//        if indexPath.row == 0 {
//            cell.checkboxButton.tag = indexPath.row
//        }
//
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxButton.setImage(UIImage(systemName: value), for: .normal)

        return cell
    }
    
    
    @objc func checkBoxButtonClicked(sender: UIButton){
        print("\(sender.tag) 번째 clickedButton!")
        
            //배열 인덱스를 찾아서 done을 바꿔야 된다! 그리고 tableView갱신 해야한다 !
            
        list[sender.tag].done =  !list[sender.tag].done
            
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        //reloadData -> 모든 셀을 다 하기 때문에 비효율적
        //남의코드 샘플
//        if list[sender.tag].done {
//                    sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
//                    list[sender.tag].done = false
//                } else {
//                    sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
//                    list[sender.tag].done = true
//                }
//
            
            
         //재사용셀 오류 확인용 코드
        //sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        
        
    }
    
    
    
    
    //편집이 가능한 상태로 바뀜
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    //우측스와이프 디폴트 기능 : commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            //배열 삭제 후 테이블뷰 갱신
            list.remove(at: indexPath.row)
           // tableView.reloadData()
        }
    }
    
  
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기버튼, 핀고정, 왼쪽에서 나옴
//    }
//
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    } // 오른쪽에서 나옴
    
}
