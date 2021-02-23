//
//  TeamCollectionViewCell.swift
//  NBAPlayers
//
//  Created by A L E X on 2/22/21.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    var team: Team?
    
    //MARK: - Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = self.frame.height / 2
    }
    
}
