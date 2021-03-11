//
//  TeamsViewController.swift
//  NBAPlayers
//
//  Created by A L E X on 2/22/21.
//

import UIKit

class TeamsViewController: UIViewController {
    
    // MARK: - Properties
    var teams: [Team] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var networkErrorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    // MARK: - Methods
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
        apiClient.getTeams(completion: {result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let teams):
                        self.teams = teams
                        self.showData()
                    case .failure:
                        self.teams = []
                        self.showError()
                }
                self.collectionView.reloadData()
            }
        })
    }
    
    // MARK: - IBActions
    @IBAction func reloadButtonTapped(_ sender: Any) {
        reloadData()
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Teams"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        reloadData()
    }
    
}

// MARK: - Extensions
extension TeamsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showTeamDetailsViewController(from: self, with: teams[indexPath.item])
    }
    
}

extension TeamsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCollectionViewCell
        
        let team = teams[indexPath.item]
        
        cell.teamLogoImageView.image = UIImage(named: "\(team.id)")
        
        cell.team = team
        
        return cell
    }
    
}
