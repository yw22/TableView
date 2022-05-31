//
//  ViewController.swift
//  TableView
//
//  Created by 김영욱 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController{
    
    
    var moviesArray: [Movie] = []
    
    var movieDataManager = DataManager()
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        tableView.delegate = self
        
        movieDataManager.makeMovieData()
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let arr = movieDataManager.getMovieData()
            
            let indexPath = sender as! IndexPath
            detailVC.movieData = arr[indexPath.row]
        }
    }
}
