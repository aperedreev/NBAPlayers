//
//  GameTableViewCell.swift
//  NBAPlayers
//
//  Created by A L E X on 01.02.2021.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var game: _Game?
    
    // MARK: - IBOutlets
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeTeamWinPointerLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var gameDateLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var awayTeamLogoImageView: UIImageView!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var awayTeamWinPointerLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    // MARK: - Methods
    func showWinnerScore(_ game: _Game) {
        if (game.homeTeamScore ?? 0 > game.awayTeamScore ?? 0) {
            homeTeamWinPointerLabel.isHidden = false
            awayTeamWinPointerLabel.isHidden = true
        } else if (game.homeTeamScore ?? 0 < game.awayTeamScore ?? 0) {
            homeTeamWinPointerLabel.isHidden = true
            awayTeamWinPointerLabel.isHidden = false
        } else {
            homeTeamWinPointerLabel.isHidden = true
            awayTeamWinPointerLabel.isHidden = true
        }
    }
    
    //MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
