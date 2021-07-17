//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    // MARK: - Properties
    var player: _Player?
    
    // MARK: - IBOutlets
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    
    // MARK: - Methods
    
    
    // MARK: - IBActions
    @IBAction func teamButtonTapped(_ sender: Any) {
        showTeamDetailsViewController(from: self, with: player!.team)
        
    }
   
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = player?.fullName
        navigationController?.navigationBar.prefersLargeTitles = true
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        weightLabel.text = player?.weight
        teamButton.setImage(UIImage(named: "\(player?.team.id ?? 00)"), for: .normal)
    }
    
}
