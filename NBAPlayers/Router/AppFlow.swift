//
//  AppFlow.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 17.07.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class AppFlow: Flow {
    var root: Presentable {
        return self.rootWindow
    }

    private let rootWindow: UIWindow
    private let serviceContainer: APIServiceContainer

    init(withWindow window: UIWindow, serviceContainer: APIServiceContainer) {
        self.rootWindow = window
        self.serviceContainer = serviceContainer
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .onboardingIsComplete:
            return navigateToDashboardFlow()
        default:
            return .none
        }
    }

    private func navigateToDashboardFlow() -> FlowContributors {
        let dashboard = DashboardFlow(serviceContainer: serviceContainer)
        Flows.use(dashboard, when: .ready) { root in
            self.rootWindow.rootViewController = root
        }

        return .one(flowContributor: .contribute(withNextPresentable: dashboard,
                                                 withNextStepper: OneStepper(withSingleStep: AppStep.dashboard)))
    }
}

final class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    var initialStep: Step {
        return AppStep.onboardingIsComplete
    }

    func readyToEmitSteps() {
        steps.accept(AppStep.onboardingIsComplete)
    }
}

