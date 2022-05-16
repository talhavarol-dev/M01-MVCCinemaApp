//
//  MoviesListTableViewCell.swift
//  M01Project
//
//  Created by Muhammet  on 16.05.2022.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {

    @IBOutlet weak var moviDetailLabel: UILabel!
    @IBOutlet weak var moviNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
