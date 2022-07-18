//
//  ViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var date2Label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var blueViewLeadingConstant: NSLayoutConstraint!
    @IBOutlet var dateLabelCollection : [UILabel]!
    
    let format = DateFormatter()
    //변수의 스코프
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabelDesign()
        format.dateFormat = "yyyy/MM/dd" //언제실행이될지 모른다 그래서 함수 밖에 놓지 않음
    
        UIAlertController(title: "alert", message: "stop", preferredStyle: .alert) //.init 생략되어있는 형태 , DateFormatter도 마찬가지
        
        blueViewLeadingConstant.constant = 120
    }
    
    func configureLabelDesign(){
        //1. OutletCollection
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }
        //2. UILabel
        let labelArray = [dateLabel,date2Label] //-> 함수안에서만 사용가능-> 계속 사용해야하는 것은 밖에다
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        
        dateLabel.text = "first"
        date2Label.text = "second"
        
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
       
        
        
        dateLabel.text = format.string(from: sender.date) // -> 스트링으로 변환
        
        
        
        
    
    }
    
    
    
}

