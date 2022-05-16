//
//  MoviesListViewController.swift
//  M01Project
//
//  Created by Muhammet  on 16.05.2022.
//

import UIKit
import Alamofire
import Kingfisher
class MoviesListViewController: UIViewController {
    
    //MARK: -IBOutlet
    
    @IBOutlet weak var moviListTableView: UITableView!
    //MARK: -Properties
   
    
    var movis:[Result] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviListTableView.dataSource = self
        moviListTableView.delegate = self
        
        let nib = UINib(nibName: String(describing: MoviesListTableViewCell.self), bundle: nil)
        moviListTableView.register(nib, forCellReuseIdentifier: String(describing: MoviesListTableViewCell.self))
        
        getMovies()
    }
    
    
    // MARK: - Functions
    func getMovies(){
        let url = URL(string:"https://api.themoviedb.org/3/discover/movie?api_key=59d1ea6d131e11d3a7f4921da8243138")
        let request = AF.request(url!, method: .get)
        request.responseDecodable(of: DataModel.self) { (response) in
            guard let movies = response.value else { return }
            self.movis = movies.results
            self.moviListTableView.reloadData()
        }
      }
 }

// MARK: - Extension
extension MoviesListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
extension MoviesListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movis.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviListTableView.dequeueReusableCell(withIdentifier: String(describing: MoviesListTableViewCell.self), for: indexPath) as! MoviesListTableViewCell
        let movis = movis[indexPath.row]
       
        cell.moviNameLabel.text = movis.title
        cell.moviDetailLabel.text = movis.overview
        
        // image get kf
        let urlString = "https://image.tmdb.org/t/p/w1280" + movis.poster_path
        let url = URL(string: urlString)
        cell.movieImageView.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
       
      // StoryBoard Segue / selected index value id detail
        let driverDetailStoryBoard = UIStoryboard(name: "DetailMovies", bundle: nil)
        let detailViewController = driverDetailStoryBoard.instantiateViewController(withIdentifier: "DetailMoviesViewController") as! DetailMoviesViewController
        self.navigationController?.pushViewController(detailViewController, animated: true)
        detailViewController.targetMovieImage = movis[indexPath.row].poster_path
        detailViewController.targetMovieDetail = movis[indexPath.row].overview
        detailViewController.targetMovieName = movis[indexPath.row].title
        
     }
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.source.storyboard == "DetailMoviesViewController" {
            guard let destinationVC = segue.destination as? DetailMoviesViewController else {return}
            destinationVC.targetMovieName = selectedMovieName
            destinationVC.targetMovieDetail = selectedMovieDetail
            destinationVC.targetMovieImage = selectedMovieImage
        }
    }
    */
    
}
