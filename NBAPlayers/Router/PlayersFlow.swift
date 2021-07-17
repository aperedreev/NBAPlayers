//
//  PlayersFlow.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 17.07.2021.
//

import UIKit
import RxFlow
import RxCocoa

final class PlayersFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    private let serviceContainer: APIServiceContainer

    init(serviceContainer: APIServiceContainer) {
        self.serviceContainer = serviceContainer
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .players:
            return navigationToPlayersScreen()
        default:
            return .none
        }
    }


    private func navigationToPlayersScreen() -> FlowContributors {
        let viewController = PlayersScreenViewController.instantiate()
        let viewModel = PlayersScreenViewModel()
        viewController.inject(viewModel)

        rootViewController.pushViewController(viewController, animated: true)

        return .one(flowContributor: .contribute(withNextPresentable: viewController,
                                                 withNextStepper: viewModel))
    }
}


