//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    
    }

    //섹션의 갯수 = 1, 셀의 갯수 = 배열의 수 만큼,
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movie.allCases.count
     
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! SearchTableViewCell
        cell.posterImageView.image = Movie.allCases[indexPath.section].moviePoster
        cell.movieTitleLabel.text = Movie.allCases[indexPath.section].rawValue
        cell.movieDateLabel.text = Movie.allCases[indexPath.section].movieDate
        
        cell.movieContentLabel.text = Movie.allCases[indexPath.section].movieContentLabel
        
        
        
        return cell
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
         
    }

}
