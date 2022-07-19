//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    var list = ["darkknight","amelia","thor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        list.append("starwars")
        list.append("minari")
    }
    
    @IBAction func userTextFieldEnterTapped(_ sender: UITextField) {
        
        list.append(userTextField.text!)
        
        //중요한 코드!,tableview를 다시그려달라
        tableView.reloadData()
        
        //tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"BuketlistTableViewCell", for: indexPath) as! BuketlistTableViewCell //as? 타입캐스팅
        
        cell.bucketlistLabel.text = list[indexPath.row]
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        return cell
        
        
        
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
            tableView.reloadData()
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
