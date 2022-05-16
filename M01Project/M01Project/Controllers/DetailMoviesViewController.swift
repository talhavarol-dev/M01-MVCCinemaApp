//
//  DetailMoviesViewController.swift
//  M01Project
//
//  Created by Muhammet  on 16.05.2022.
//

import UIKit
import Alamofire
import Kingfisher
class DetailMoviesViewController: UIViewController {

    let mainVC = MoviesListViewController()
    
    @IBOutlet weak var MovieName: UILabel!
    @IBOutlet weak var movieDetailDesc: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    
    var targetMovieName = String()
    var targetMovieDetail = String()
    var targetMovieImage = String()
    
    
    
    var selectedMoviesId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://image.tmdb.org/t/p/w1280" + targetMovieImage
        let url = URL(string: urlString)
        
        MovieName.text = targetMovieName
        movieDetailDesc.text = targetMovieDetail
        detailImageView.kf.setImage(with: url)
        
    }


    

}
