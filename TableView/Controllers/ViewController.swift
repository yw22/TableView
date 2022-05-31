//
//  ViewController.swift
//  TableView
//
//  Created by 김영욱 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController{
    
    // 테이블뷰의 데이터를 표시하기 위한 배열
    var moviesArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var movieDataManager = DataManager()
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "영화목록"
        
        // 셀의 높이 설정
        tableView.rowHeight = 120
        
        
        movieDataManager.makeMovieData() // 서버에 요청하는것 처럼 코드작성
        
    }
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        movieDataManager.updateMovieData()
        
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    // 테이블뷰에 몇개의 데이터를 표시할 것인지를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    // 셀의 구성을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // 재사용 가능한 셀을 꺼내서 사용하는 메서드
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let array = movieDataManager.getMovieData()
        
        let movie = array[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.MovieNameLabel.text = movie.movieName
        cell.descriptionLable.text = movie.movieDescription
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //세그웨이 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let arr = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            
            // 배열데이터를 다음화면으로 전달
            detailVC.movieData = arr[indexPath.row]
        }
    }
}
