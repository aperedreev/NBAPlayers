//
//  TeamDetailsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    @IBOutlet weak var divisionLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    var team: Team?
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = team?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        
        teamLogoImageView.image = UIImage(named: "\(team?.id ?? 1)")
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
        divisionLabel.text = team?.division
    }
    
    
}
