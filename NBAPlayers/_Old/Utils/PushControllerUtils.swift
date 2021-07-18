//
//  PushControllerUtils.swift
//  NBAPlayers
//
//  Created by A L E X on 10.02.2021.
//

import Foundation
import UIKit

func showPlayerDetailsViewController(from controller: UIViewController, with player: _Player) {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController
    
    viewController.player = player
    
    controller.navigationController?.pushViewController(viewController, animated: true)
}

func showTeamDetailsViewController(from controller: UIViewController, with team: _Team) {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
    
    viewController.team = team
    
    controller.navigationController?.pushViewController(viewController, animated: true)
}

func showGameDetailsViewController(from controller: UIViewController, with game: _Game) {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateViewController(identifier: "GameDetailsViewController") as! GameDetailsViewController
    
    viewController.game = game
    
    controller.navigationController?.pushViewController(viewController, animated: true)
}
