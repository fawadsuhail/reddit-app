import Foundation
import UIKit

class AppCoordinator {
    private lazy var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        return window
    }()

    private lazy var mainNavigationController: UINavigationController = {
        let rootViewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }()

    func start() {
        setupMainView()
    }

    private func setupMainView() {
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
    }
}
