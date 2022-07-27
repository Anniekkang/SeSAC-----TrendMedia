//
//  TrendTableTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/21.
//

import UIKit

class TrendTableTableViewController: UITableViewController {

    
    //MARK:
    ///시작화면
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func movieButtonTapped(_ sender: UIButton) {
        
        // 1.
        let sb = UIStoryboard(name: "Trend - case2", bundle: nil)
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as!
        BucketlistTableViewController
        //3.
        self.present(vc, animated: true)
        
    }
    
    
    @IBAction func dramaButtonTapped(_ sender: UIButton) {
        
        // 1.
        let sb = UIStoryboard(name: "Trend - case2", bundle: nil)
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as!
        BucketlistTableViewController
        //2.5 prsent시 옵션
        vc.modalPresentationStyle = .fullScreen
        //3.
        self.present(vc, animated: true)
    
    }
    
    
    @IBAction func booksButtonsTapped(_ sender: UIButton) {
        // 1.
        let sb = UIStoryboard(name: "Trend - case2", bundle: nil)
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as!
        BucketlistTableViewController
        
        vc.textfieldPlaceholder = "도서"
        
        
        //2.5
        let nav = UINavigationController(rootViewController: vc)
        
        
        //2.5 prsent시 옵션
        nav.modalPresentationStyle = .fullScreen
        //3.
        self.present(nav, animated: true)
    
        
        
        
    }
    
}
