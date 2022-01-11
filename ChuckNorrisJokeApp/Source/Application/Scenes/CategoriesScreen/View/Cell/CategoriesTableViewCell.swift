//
//  CategoriesTableViewCell.swift
//  ChuckNorrisJokeApp
//
//  Created by APPLE DEVELOPER ACADEMY on 06/12/21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cellIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    
    func setupView() {
        cellIcon.image = UIImage(systemName: "chevron.right")
    }
    
}
