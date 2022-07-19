//
//  Setting2TableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/18.
//

import UIKit

//CAseIteralble : 프로토콜, 배열처럼 열거형을 활용할 수 있는 특성
enum SettingOptions : Int, CaseIterable {
    case total, personal, others
    
    var sectionTitle : String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }

    
    var rowTitle : [String] {
        switch self {
        case .total :
            return ["notice","lab","verson"]
        case .personal :
            return ["privacy","alert","chatting","multiprofile"]
        case .others :
            return ["suppport"]
        }
    }
    
}

class Setting2TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].rowTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].sectionTitle
    }
    
 
    

    
}
        
        
        
    
    
    
    
  
    
    
 
    


