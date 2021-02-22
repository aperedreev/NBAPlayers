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
    @IBOutlet weak var networkErrorLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    
    var games: [Game] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Games"
        
        reloadData()
    }
    
    @IBAction func onReloadButtonTap(_ sender: Any) {
        reloadData()
    }
    
    private func showLoading() {
        networkErrorLabel.isHidden = true
        reloadButton.isHidden = true
        activityIndicatorView.startAnimating()
    }
    
    private func showData() {
        networkErrorLabel.isHidden = true
        reloadButton.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    private func showError() {
        networkErrorLabel.isHidden = false
        reloadButton.isHidden = false
        activityIndicatorView.stopAnimating()
    }
    
    private func reloadData() {
        showLoading()
        apiClient.getGames(completion: {result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let games):
                        self.games = games.reversed()
                        self.showData()
                    case .failure:
                        self.games = []
                        self.showError()
                }
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableViewCell
        
        let game = games[indexPath.section]
        
        cell.homeTeamLogoImageView.image = UIImage(named: "\(game.homeTeam.id).png")
        cell.awayTeamLogoImageView.image = UIImage(named: "\(game.awayTeam.id).png")
        cell.homeTeamLabel.text = game.homeTeam.name
        cell.homeScoreLabel.text = String(game.homeTeamScore!)
        cell.awayTeamLabel.text = game.awayTeam.name
        cell.awayScoreLabel.text = String(game.awayTeamScore!)
        cell.gameDateLabel.text = game.date
        cell.gameStatusLabel.text = game.status.uppercased()
        if game.homeTeamScore == 0 && game.awayTeamScore == 0 {
            cell.homeScoreLabel.text = "-"
            cell.awayScoreLabel.text = "-"
        }
        
        cell.showWinnerScore(game)
        cell.game = game
        
        if hideScoresSwitch.isOn {
            cell.homeScoreLabel.text = "-"
            cell.awayScoreLabel.text = "-"
            cell.homeTeamWinPointerLabel.isHidden = true
            cell.awayTeamWinPointerLabel.isHidden = true
        }
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showGameDetailsViewController(from: self, with: games[indexPath.section])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func OnHideScoresSwitchTap(_ sender: Any) {
        tableView.reloadData()
    }
    
}
