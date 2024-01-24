//
//  MovieViewController.swift
//  MovieMVVM
//
//  Created by Hmoo Myat Theingi on 23/01/2024.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.fetchMovies {
            self.tableView.reloadData()
        }

    }

}

extension MovieViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = viewModel.movies[indexPath.row]
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500" + movie.posterPath){
            cell.movieImage.load(url: url)
        }
        cell.movieReleasedDate.text = movie.releasedDate
        cell.movieTitle.text = movie.title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        detailVC.movie = viewModel.movies[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
