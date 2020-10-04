//
//  ViewController.swift
//  Flix
//
//  Created by Justin Ralph on 9/23/20.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        let BaseURL = "https://image.tmdb.org/t/p/w185"
        let PosterPath = movie["poster_path"] as! String
        let PosterURL = URL(string: BaseURL + PosterPath)
        
        cell.Title!.text = title
        cell.Synopsis!.text = synopsis
        cell.Poster.af.setImage(withURL: PosterURL!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
    
        //Pass selected movie to details page
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Pass trailer link
        //let TrailerViewController = segue.destination as! TrailerViewController
        //TrailerViewController.movie = movie
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        // TODO: Store the movies in a property to use elsewhere
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
              // TODO: Reload your table view data
            self.tableView.reloadData()

           }
        }
        task.resume()


    }


}

