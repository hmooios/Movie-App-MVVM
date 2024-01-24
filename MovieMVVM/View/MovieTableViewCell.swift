//
//  MovieTableViewCell.swift
//  MovieMVVM
//
//  Created by Hmoo Myat Theingi on 23/01/2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieReleasedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
