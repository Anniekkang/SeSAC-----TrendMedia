//
//  SearchTableViewCell.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

enum Movie : String, CaseIterable {
    case Frozen,Avartar,Aladin,Monster,thieves,taxidriver
    
    var moviePoster : UIImage {
        switch self {
        case .Frozen :
            return UIImage(named: "Frozen")!
        case .Avartar :
            return UIImage(named: "Avartar")!
        case .Aladin :
            return UIImage(named: "Aladin")!
        case .Monster :
            return UIImage(named: "Monster")!
        case .thieves :
            return UIImage(named: "thieves")!
        case .taxidriver :
            return UIImage(named: "taxidriver")!
        }
    }
    
    
    var movieDate : String {
        switch self {
        case .Frozen :
            return "2020.10.30"
        case .Avartar :
            return "2015.10.29"
        case .Aladin :
            return "2020.10.28"
        case .Monster :
            return "1999.10.27"
        case .thieves :
            return "2002.10.26"
        case .taxidriver :
            return "2020.11.30"
            
            }
    }
        
    var movieContentLabel : String {
        switch self {
        case .Frozen :
            return "aaaaaaa"
        case .Avartar :
            return "bbbbbbb"
        case .Aladin :
            return "cccccc"
        case .Monster :
            return "dddddd"
        case .thieves :
            return "eeeeee"
        case .taxidriver :
            return "ffffff"
            }
        }
    }



class SearchTableViewCell: UITableViewCell {

   
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
   
    @IBOutlet weak var movieContentLabel: UILabel!
    
   
}

