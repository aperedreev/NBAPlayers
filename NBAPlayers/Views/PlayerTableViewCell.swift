//
//  PlayerTableViewCell.swift
//  NBAPlayers
//
//  Created by A L E X on 2/16/21.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    // MARK: - IBOutlets
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerTeamLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
