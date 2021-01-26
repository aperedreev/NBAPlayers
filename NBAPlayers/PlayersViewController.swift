//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let players: [Player] = [
        Player(
            firstName: "LeBron",
            lastName: "James",
            team: lakers,
            position: "SF",
            height: "6'76''"
        ),
        Player(
            firstName: "Anthony",
            lastName: "Davis",
            team: lakers,
            position: "PF",
            height: "6'10''"
        ),
        Player(
            firstName: "Jimmy",
            lastName: "Butler",
            team: heat,
            position: "SG",
            height: "6'8''"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Players"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        let player = players[indexPath.row]
        
        cell.textLabel?.text = player.fullName
        cell.detailTextLabel?.text = player.team.fullTeamName
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController
        
        let player = players[indexPath.row]
        viewController.player = player
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
