//
//  TrendTableTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/21.
//

import UIKit

class TrendTableTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func movieButtonTapped(_ sender: UIButton) {
        
        //화면전환 : 1, 전환하고자하는 스토리보드파일찾기, 2. 스토리보드내의 VC 찾기 3.화면전환
        //영화 버튼 클릭 시 버킷리스트테이블뷰컨트롤러 띄워주기,present방식(아래에서위)
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
        
        //2.5
        let nav = UINavigationController(rootViewController: vc)
        
        
        
        //2.5 prsent시 옵션
        nav.modalPresentationStyle = .fullScreen
        //3.
        self.present(nav, animated: true)
    
        
        
        
    }
    
}
