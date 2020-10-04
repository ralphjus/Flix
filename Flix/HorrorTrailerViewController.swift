//
//  HorrorTrailerViewController.swift
//  Flix
//
//  Created by Justin Ralph on 10/3/20.
//

import UIKit
import WebKit

class HorrorTrailerViewController: UIViewController, WKUIDelegate {    var webView: WKWebView!
    
    var movie : [String:Any]!
    
    
    override func loadView() {
        
        
        let urlID = movie["id"] as! Double
        
        let StringID = String(format: "%.0f", urlID)
        
        // Create URL
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(StringID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in

            do {
                      if let DataDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                           
                           // Get value by key
                           let GetVideos = DataDictionary["results"] as! [[String:Any]]
                           let index = GetVideos[0]
                           let key = index["key"] as! String
                        
                            RecoverKey.videoURL = "https://www.youtube.com/watch?v=\(key)"
                       }
            } catch let error as NSError {
                       print(error.localizedDescription)
             }

        }
        task.resume()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    struct RecoverKey {
         static var videoURL = "someString"
    }
    
    @IBOutlet weak var TrailerPlayer: WKWebView!
    

    override func viewWillAppear(_ animated: Bool) {
        print(RecoverKey.videoURL)
        let myURL = URL(string: RecoverKey.videoURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
