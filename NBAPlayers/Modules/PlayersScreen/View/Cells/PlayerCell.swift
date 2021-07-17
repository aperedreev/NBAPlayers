//
//  PlayerCell.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import UIKit
import Reusable
import SnapKit

class PlayerCell: UITableViewCell, Reusable {
    
    var playerNameLabel: UILabel!
    var playerTeamLabel: UILabel!
    var teamLogoImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
