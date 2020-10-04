//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Justin Ralph on 9/30/20.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
        let BaseURL = "https://image.tmdb.org/t/p/w185"
        let PosterPath = movie["poster_path"] as! String
        let PosterURL = URL(string: BaseURL + PosterPath)
        cell.posterView.af.setImage(withURL: PosterURL!)
        
        return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        //layout.minimumLineSpacing = 4
        //layout.minimumInteritemSpacing = 4
        
        //let width = (view.frame.size.width - (layout.minimumInteritemSpacing * 2)) / 3
        
        //layout.itemSize = CGSize(width: width, height: width / (2/3))

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/138/recommendations?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
              // TODO: Get the array of movies
            self.movies = dataDictionary["results"] as! [[String:Any]]
              // TODO: Reload your collection view data
            self.collectionView.reloadData()

           }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Find the selected movie
        
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
    
        //Pass selected movie to details page
        let detailsViewController = segue.destination as! HorrorMovieDetailsViewController
        detailsViewController.movie = movie
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
