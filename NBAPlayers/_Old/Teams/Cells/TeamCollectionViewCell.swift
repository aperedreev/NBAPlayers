//
//  TeamCollectionViewCell.swift
//  NBAPlayers
//
//  Created by A L E X on 2/22/21.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var team: Team?
    
    // MARK: - IBOutlets
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    // MARK: - Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = self.frame.height / 2
    }
    
}
