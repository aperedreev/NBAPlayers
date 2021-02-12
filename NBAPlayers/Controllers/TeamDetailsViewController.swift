//
//  TeamDetailsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = team?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }
    

}
