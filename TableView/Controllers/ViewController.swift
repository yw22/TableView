//
//  ViewController.swift
//  TableView
//
//  Created by 김영욱 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    var moviesArray: [Movie] = []
    
    var movieDataManager = DataManager()
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
        
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = moviesArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.MovieNameLabel.text = movie.movieName
        cell.descriptionLable.text = movie.movieDescription
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

