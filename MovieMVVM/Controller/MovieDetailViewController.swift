//
//  MovieDetailViewController.swift
//  MovieMVVM
//
//  Created by Hmoo Myat Theingi on 23/01/2024.
//

import Foundation
import UIKit

class MovieDetailViewController:UIViewController{
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    
    @IBOutlet var movieOverview: UITextView!
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            movieTitle.text = movie.title
            movieOverview.text = movie.overview
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + movie.posterPath){
                movieImage.load(url: url)
            }
        }
    }
    
}
