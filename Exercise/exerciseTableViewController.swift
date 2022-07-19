//
//  exerciseTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

class exerciseTableViewController: UITableViewController {

    enum SectionsTitle : Int, CaseIterable {
        case whole = 0, personal, others
        
        var titleLabel : String {
            switch self {
            case .whole :
                return "Whole Setting"
            case .personal :
                return "Personal Setting"
            case .others :
                return "others Setting"
            
            }
        }
        
        //section == 0
        var SettingElement : [String] {
            switch self {
            case .whole :
                return ["notice","lab","version"]
            case .personal :
                return ["privacy","alert","chatting","multiprofile"]
            case .others :
                return ["support"]
            }
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
   
    
    //섹션의 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SectionsTitle.allCases.count
    }
    
    //셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SectionsTitle.allCases[section].SettingElement.count
    }
    
    
    //셀을 커스텀 하는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .systemGray
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        cell.textLabel?.text = SectionsTitle.allCases[indexPath.section].SettingElement[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionsTitle.allCases[section].titleLabel
    }
    

}


//override func numberOfSections(in tableView: UITableView) -> Int {
//    return SettingOptions.allCases.count
//
//}
//override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return SettingOptions.allCases[section].rowTitle.count
//}
//
//override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
//    cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
//    return cell
//}
//
//override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    return SettingOptions.allCases[section].sectionTitle
//}
