//
//  UIViewController+Extension.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

extension UIViewController {
    func setBackGroundColor(){
        
        view.backgroundColor = .yellow
    }
    
    func showAlert(title : String, message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
    
}


