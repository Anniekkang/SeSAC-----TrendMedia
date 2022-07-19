//
//  Setting2TableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/18.
//

import UIKit


//struct settingValues {
//    var wholeSetting = ["notice", "lab", "versionInfo"]
//    var individualSetting = ["privacy","alert","chat","multiprofile" ]
//    var extraSetting = "support"
//}
class Setting2TableViewController: UITableViewController {
    
    @IBOutlet var settingTableView: UITableView!
    
    var wholeSetting = ["notice", "lab", "versionInfo"]
    var individualSetting = ["privacy","alert","chat","multiprofile" ]
    var extraSetting = "support"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfSections(in: settingTableView)
        tableView(settingTableView, numberOfRowsInSection: 3)
        
        

    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        
        if indexPath.section == 0 {
//
           
                cell.textLabel?.text = wholeSetting[indexPath.row]
            cell.textLabel?.textColor = .white
            
        } else if indexPath.section == 1 {
            cell.textLabel?.text = individualSetting[indexPath.row]
            cell.textLabel?.textColor = .white
           
        } else if indexPath.section == 2 {
            cell.textLabel?.text = extraSetting
            cell.textLabel?.textColor = .white
        } else {
            cell.textLabel?.text = nil
            cell.textLabel?.textColor = .white
        }
        
        cell.backgroundColor = .black
        print("annie1")
        return cell
        
     
       
        }
        
        
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "WholeSetting"
        } else if section == 1 {
            return "IndividualSetting"
        } else if section == 2 {
            return "Extra"
        } else {
            return "Header"
        }
    }
    
}
        
        
        
    
    
    
    
  
    
    
 
    


