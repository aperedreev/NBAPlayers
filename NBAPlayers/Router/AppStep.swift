//
//  AppStep.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 17.07.2021.
//

import Foundation
import RxFlow
import RxCocoa

enum AppStep: Step {
    case onboardingIsComplete
    case dashboard
    case players
    case playerDetails
    case teams
    case teamDetails
    case games
    case gameDetails
    case none
}
