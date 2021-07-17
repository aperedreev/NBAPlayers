//
//  DashboardFlow.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 17.07.2021.
//

import UIKit
import RxFlow
import RxCocoa

enum TabBarItem: Int {
    case players
}

fileprivate typealias UINC = UINavigationController

final class DashboardFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UITabBarController = {
        let viewController = UITabBarController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        return viewController
    }()

    private let serviceContainer: APIServiceContainer

    private let playersFlow: PlayersFlow

    init(serviceContainer: APIServiceContainer) {
        self.serviceContainer = serviceContainer
        self.playersFlow = PlayersFlow(serviceContainer: serviceContainer)
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .dashboard:
            return navigateToDashboard()
        default:
            return .none
        }
    }

    private func navigateToDashboard() -> FlowContributors {

        Flows.use(playersFlow,
                  when: .ready) { [unowned self] (root1: UINC) in

            let tabBarItem1 = UITabBarItem(title: "Главная",
                                           image: UIImage(named: "mainActive"),
                                           selectedImage: UIImage(named: "mainInactive"))

            root1.tabBarItem = tabBarItem1

            rootViewController.setViewControllers([root1], animated: true)
        }

        return .multiple(flowContributors: [.contribute(withNextPresentable: playersFlow,
                                                                       withNextStepper: OneStepper(withSingleStep: AppStep.players)),
                                            ])
    }
}

