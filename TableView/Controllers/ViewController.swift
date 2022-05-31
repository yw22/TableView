//
//  ViewController.swift
//  TableView
//
//  Created by 김영욱 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    var moviesArray: [Movie] = [
        Movie(movieImage: UIImage(named: "batman.pnp"), movieName: "배트맨", movieDescription: "배트맨이 출현하는 영화"),
        Movie(movieImage: UIImage(named: "captain.pnp"), movieName: "캡틴 아메리카", movieDescription: "캡틴 아메리카의 기원")
    
    
    
    ]
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
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
        
        return cell
    }
    
    
}

