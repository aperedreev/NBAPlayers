//
//  TeamsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 2/22/21.
//

import UIKit

class TeamsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var teams: [Team] = []
    var team: Team?
    let apiClient: ApiClient = ApiClientImpl()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Teams"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        reloadData()
    }
    
    private func reloadData() {
//        showLoading()
        apiClient.getTeams(completion: {result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let teams):
                        self.teams = teams
//                        self.showData()
                    case .failure:
                        self.teams = []
//                        self.showError()
                }
                self.collectionView.reloadData()
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCollectionViewCell
        
        let team = teams[indexPath.item]
        
        cell.teamLogoImageView.image = UIImage(named: "\(team.id).png")
        
        cell.team = team
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showTeamDetailsViewController(from: self, with: teams[indexPath.item])
    }
    
}
