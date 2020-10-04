//
//  HorrorMovieDetailsViewController.swift
//  Flix
//
//  Created by Justin Ralph on 9/30/20.
//

import UIKit
import AlamofireImage

class HorrorMovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!

    @IBOutlet weak var posterView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie : [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let year = movie["release_date"] as! String
        
        titleLabel.text = movie["title"] as! String + " " + "(\(year.prefix(4)))"
        synopsisLabel.text = movie["overview"] as? String

        let BaseURL = "https://image.tmdb.org/t/p/w185"
        let PosterPath = movie["poster_path"] as! String
        let PosterURL = URL(string: BaseURL + PosterPath)
        
        posterView.af.setImage(withURL: PosterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af.setImage(withURL: backdropURL!)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Find the selected movie
    
        //Pass selected movie to details page
        let detailsViewController = segue.destination as! HorrorTrailerViewController
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
