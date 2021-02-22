//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = player?.fullName
        navigationController?.navigationBar.prefersLargeTitles = true
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        weightLabel.text = player?.weight
//        teamButton.setTitle(player?.team.fullTeamName, for: .normal)
        teamButton.setImage(UIImage(named: "\(player?.team.id ?? 00).png"), for: .normal)
    }
    
 
    @IBAction func onTeamButtonTap(_ sender: Any) {
        
        showTeamDetailsViewController(from: self, with: player!.team)
        
    }
   
    
}
