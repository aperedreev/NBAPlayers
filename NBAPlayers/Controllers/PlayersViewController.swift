//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import UIKit

class PlayersViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    var players: [Player] = []
    let apiClient: ApiClient = ApiClientImpl()

    // MARK: - Methods
    @IBAction func onReloadButtonTap(_ sender: Any) {
        reloadData()
    }
    
    private func showLoading() {
        errorLabel.isHidden = true
        reloadButton.isHidden = true
        activityIndicatorView.startAnimating()
    }
    
    private func showData() {
        errorLabel.isHidden = true
        reloadButton.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    private func showError() {
        errorLabel.isHidden = false
        reloadButton.isHidden = false
        activityIndicatorView.stopAnimating()
    }
    
    private func reloadData() {
        showLoading()
        apiClient.getPlayers(completion: {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                    self.showData()
                case .failure:
                    self.players = []
                    self.showError()
                }
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        })
    }

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Players"
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadData()
    }
}

// MARK: - Extensions
extension PlayersViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        
        let player = players[indexPath.row]
        
        cell.playerNameLabel.text = player.fullName
        cell.playerTeamLabel.text = "\(player.team.abbreviation) ｜ \(player.position)"
        cell.teamLogoImageView.image = UIImage(named: "\(player.team.id)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showPlayerDetailsViewController(from: self, with: players[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
