//
//  GamesViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 28.01.2021.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hideScoresSwitch: UISwitch!
    
    var games: [Game] = [
        Game(
             homeTeam: lakers,
             awayTeam: heat,
             homeTeamScore: 124,
             awayTeamScore: 167,
             date: "2019-01-14",
             season: 2019,
             period: 4,
             status: "Final"),
        Game(
             homeTeam: heat,
             awayTeam: lakers,
             homeTeamScore: 113,
             awayTeamScore: 135,
             date: "2019-01-24",
             season: 2019,
             period: 3,
             status: "Final"),
        Game(
             homeTeam: lakers,
             awayTeam: heat,
             homeTeamScore: 154,
             awayTeamScore: 139,
             date: "2019-01-31",
             season: 2019,
             period: 6,
             status: "Final")
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Games"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableViewCell
        
        let game = games[indexPath.row]
        
        cell.homeTeamLabel.text = game.homeTeam.name
        cell.homeScoreLabel.text = String(game.homeTeamScore!)
        cell.awayTeamLabel.text = game.awayTeam.name
        cell.awayScoreLabel.text = String(game.awayTeamScore!)
        cell.gameDateLabel.text = game.date
        cell.gameSeasonLabel.text = "Season: \(game.season)"
        cell.gameStatusLabel.text = game.status.uppercased()
        
        cell.showWinnerScore(game)
        cell.game = game
        
        if hideScoresSwitch.isOn {
            cell.homeScoreLabel.isHidden = true
            cell.awayScoreLabel.isHidden = true
            cell.homeTeamWinPointer.isHidden = true
            cell.awayTeamWinPointer.isHidden = true
        } else {
            cell.homeScoreLabel.isHidden = false
            cell.awayScoreLabel.isHidden = false
        }
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
//            navigationController?.setNavigationBarHidden(true, animated: true)
            hideScoresSwitch.isHidden = true

        } else {
//            navigationController?.setNavigationBarHidden(false, animated: true)
            hideScoresSwitch.isHidden = false
        }
    }
    
    @IBAction func hideScoresOn(_ sender: Any) {
        
        tableView.reloadData()
        
    }
    
}
