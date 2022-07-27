//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 나리강 on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var movieList = MovieInfo()
    static var identifier = "SearchTableViewController"

    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
        
        
        
        
        
        tableView.reloadData()
    
    }
    
    @objc func resetButtonClicked(){
        
        let sb = UIStoryboard(name: "Trend - case2", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        
       //iOS13+ SceneDelegate 를 쓸 때 동작하는 코드
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene //앱을 처음 킨 상태로 돌아가는 코드
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
        
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
        cell.posterImageView.image = Movie.allCases[indexPath.row].moviePoster
        Movie.Avartar.moviePoster
        cell.movieTitleLabel.text = Movie.allCases[indexPath.row].rawValue
        cell.movieDateLabel.text = Movie.allCases[indexPath.row].movieDate
        
        cell.movieContentLabel.text = Movie.allCases[indexPath.row].movieContentLabel
        
        
        
        return cell
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
         
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didselectRowAt") //동작하지 않는다면? 1. TableView가 noselection, 2 셀위에 전체버튼
        let sb = UIStoryboard(name: "Trend - case2", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewController") as! RecommandCollectionViewController
        
        //2. 값전달 - vc가 가지고 있는 프로퍼티에 데이터 추가
        let title = movieList.movie[indexPath.row].title
        let release = movieList.movie[indexPath.row].releaseDate
       
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
