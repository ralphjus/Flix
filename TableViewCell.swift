//
//  TableViewCell.swift
//  Flix
//
//  Created by Justin Ralph on 9/23/20.
//

import UIKit
import AlamofireImage

class TableViewCell: UITableViewCell {
    @IBOutlet weak var Poster: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var Synopsis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
