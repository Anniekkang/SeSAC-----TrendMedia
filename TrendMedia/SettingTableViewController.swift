//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {

    
    
    var birthday = ["Annie","Nari","Linda","Mina"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Birthday"
        } else if section == 1 {
            return "Favorite"
        } else if section == 2 {
            return "friends 140"
        } else {
            return "section"
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer"
    }

    //섹션의 갯수(option) -> 2개 묶음, 디폴트 = 1, return 1 인 경우 생략가능
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
   
    //⭐️1. 셀의 갯수 알려주는 함수 (필수) ex 카톡 : numberOfRowsInSection -> 묶음의 갯수, 디폴트 = 0
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthday.count
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 0
        }
        
    }
    //2. 셀의 디자인과 데이터를 넣는 작업 필수 : cellForRowAt/indexPath.row/indexPath.section
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        
        if indexPath.section == 0 {
            
            cell.textLabel?.text = birthday[indexPath.row]
            cell.textLabel?.textColor = .systemPink
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "second 텍스트"
            cell.textLabel?.textColor = .systemGray
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "third 텍스트"
            cell.textLabel?.textColor = .systemBlue
        } else {
            cell.textLabel?.text = "fourth 텍스트"
            cell.textLabel?.textColor = .systemBlue
        }
        
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        
        return cell
        
    }
    
    
    
}
