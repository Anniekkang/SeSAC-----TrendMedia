//
//  shoppingTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

class shoppingTableViewController: UITableViewController {

 
    @IBOutlet weak var shoppingTextField: UITextField!
    var shoppingList : [String] = ["우유사기","과자사기","투게더사기","약과사기"]
    
    @IBOutlet weak var shoppingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        shoppingButton.setTitle("추가", for: .normal)
        shoppingButton.setTitleColor(.systemGray3, for: .normal)
        shoppingTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실 건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        shoppingTextField.textColor = .white
        shoppingTextField.backgroundColor = .systemGray
        
 
    }

    
    @IBAction func Button(_ sender: UIButton) {
        shoppingList.append(shoppingTextField.text!)
        tableView.reloadData()
        

    }
    
  
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
       
    }
    
    
    //섹션2개 & 셀 갯수& 셀은 리스트에서 하나하나가져오고 텍스트필드에 쓴 글귀를 리스트에 추가해서 차례대로 가져오기
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! shoppingTableViewCell?
        
        cell?.shoppingListLabel.textColor = .black
        cell?.shoppingListLabel.text = shoppingList[indexPath.row]
        
        return cell!
        
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
       
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //배열 삭제 후 테이블뷰 갱신
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
   
    }

}
