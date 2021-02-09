//
//  GameTableViewCell.swift
//  NBAPlayers
//
//  Created by A L E X on 01.02.2021.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeTeamWinPointer: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var gameDateLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var awayTeamWinPointer: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var gameSeasonLabel: UILabel!
    
    var game: Game?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func showWinnerScore(_ game: Game){
        if(game.homeTeamScore ?? 0 > game.awayTeamScore ?? 0){
            homeTeamWinPointer.isHidden = false
            awayTeamWinPointer.isHidden = true
        }else if(game.homeTeamScore ?? 0 < game.awayTeamScore ?? 0){
            homeTeamWinPointer.isHidden = true
            awayTeamWinPointer.isHidden = false
        }else{
            homeTeamWinPointer.isHidden = true
            awayTeamWinPointer.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
