//
//  TrailerTableViewCell.swift
//  Flix
//
//  Created by Justin Ralph on 10/2/20.
//

import UIKit
import WebKit

class TrailerTableViewCell: UITableViewCell {

    @IBOutlet weak var TrailerPlayer: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
