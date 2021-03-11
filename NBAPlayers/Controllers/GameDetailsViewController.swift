//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 09.02.2021.
//

import UIKit

class GameDetailsViewController: UIViewController {

    //MARK: - Properties
    var game: Game?
    
    // MARK: - IBOutlets
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var awayTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamCityLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamConferenceLabel: UILabel!
    @IBOutlet weak var awayTeamCityLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamConferenceLabel: UILabel!
    @IBOutlet weak var statusTopLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var homeWinPointerLabel: UILabel!
    @IBOutlet weak var awayWinPointerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var winScoreLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var statusInListLabel: UILabel!
    @IBOutlet weak var homeTeamDetailsButton: UIButton!
    @IBOutlet weak var awayTeamDetailsButton: UIButton!

    //MARK: - Methods
    
    
    // MARK: - IBActions
    @IBAction func homeTeamDetailsButtonTapped(_ sender: Any) {
    
        showTeamDetailsViewController(from: self, with: game!.homeTeam)
    }
    
    @IBAction func awayTeamDetailsButtonTapped(_ sender: Any) {
    
        showTeamDetailsViewController(from: self, with: game!.awayTeam)
        
    }
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Game details"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        homeTeamLogoImageView.image = UIImage(named: "\(game?.homeTeam.id ?? 00)")
        awayTeamLogoImageView.image = UIImage(named: "\(game?.awayTeam.id ?? 00)")
        homeTeamCityLabel.text = "\(game?.homeTeam.city ?? "Unknown")"
        homeTeamNameLabel.text = "\(game?.homeTeam.name ?? "Home Team") (H)"
        homeTeamConferenceLabel.text = game?.homeTeam.conference
        awayTeamCityLabel.text = "\(game?.awayTeam.city ?? "Unknown")"
        awayTeamNameLabel.text = "(A) \(game?.awayTeam.name ?? "Away Team")"
        awayTeamConferenceLabel.text = game?.awayTeam.conference
        statusTopLabel.text = game?.status.uppercased()
        homeScoreLabel.text = String(game?.homeTeamScore ?? 0)
        awayScoreLabel.text = String(game?.awayTeamScore ?? 0)
        dateLabel.text = game?.date
        seasonLabel.text = String(game?.season! ?? 0)
        winScoreLabel.text = "\(max(game?.homeTeamScore ?? 0, game?.awayTeamScore ?? 0))"
        periodLabel.text = String(game?.period! ?? 0)
        statusInListLabel.text = game?.status
        
        func showWinnerScore() {
            if (game?.homeTeamScore ?? 0 > game?.awayTeamScore ?? 0) {
                homeWinPointerLabel.isHidden = false
                awayWinPointerLabel.isHidden = true
            } else if (game?.homeTeamScore ?? 0 < game?.awayTeamScore ?? 0) {
                homeWinPointerLabel.isHidden = true
                awayWinPointerLabel.isHidden = false
            } else {
                homeWinPointerLabel.isHidden = true
                awayWinPointerLabel.isHidden = true
            }
        }
        
        showWinnerScore()
        
    }
    
}

// MARK: - Extensions
