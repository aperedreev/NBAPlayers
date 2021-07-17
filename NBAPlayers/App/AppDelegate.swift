//
//  AppDelegate.swift
//  NBAPlayers
//
//  Created by A L E X on 25.01.2021.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appFlow: AppFlow!
    let coordinator = FlowCoordinator()
    private let disposeBag = DisposeBag()
    private var serviceContainer: APIServiceContainer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard let window = self.window else { return false }

        serviceContainer = buildServiceContainer()

        self.appFlow = AppFlow(withWindow: window, serviceContainer: serviceContainer)

        coordinator.rx.didNavigate
            .subscribe(onNext: { flow, step in
                print("did navigate to flow=\(flow) and step=\(step)")
            }).disposed(by: disposeBag)

        coordinator.coordinate(flow: appFlow, with: AppStepper())

        return true
    }

}

private extension AppDelegate {
    func buildServiceContainer() -> APIServiceContainer {
        return APIServiceContainer()
    }
}
