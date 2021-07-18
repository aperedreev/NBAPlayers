//
//  PlayerCell.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import UIKit
import Reusable
import SnapKit
import Then

class PlayerCell: UITableViewCell, Reusable {
    
    // MARK: - Properties
    
    var playerImageView: UIImageView!
    var playerNameLabel: UILabel!
    var playerTeamLabel: UILabel!
    var playerTeamLogoImageView: UIImageView!
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setupData(player: Player) {
        playerNameLabel.text = player.fullName
        playerTeamLabel.text = player.team.fullTeamName
        playerTeamLogoImageView.image = UIImage(named: "\(player.team.id)")
    }
    
}

// MARK: - Extensions

private extension PlayerCell {
    
    // MARK: - Private Methods
    
    func setupUI() {
        playerImageView = UIImageView().then {
            $0.image = UIImage(systemName: "person")
            $0.tintColor = .orange
        }
        contentView.addSubview(playerImageView)
        playerImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        playerNameLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 17)
        }
        contentView.addSubview(playerNameLabel)
        playerNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(playerImageView.snp.right).offset(16)
        }
        
        playerTeamLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 12)
        }
        contentView.addSubview(playerTeamLabel)
        playerTeamLabel.snp.makeConstraints {
            $0.top.equalTo(playerNameLabel.snp.bottom)
            $0.left.equalTo(playerNameLabel.snp.left)
            $0.bottom.equalToSuperview().offset(-16)
        }
        
        playerTeamLogoImageView = UIImageView()
        contentView.addSubview(playerTeamLogoImageView)
        playerTeamLogoImageView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-32)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(50)
        }
    }
}
