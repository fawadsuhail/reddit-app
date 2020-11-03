import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var appCoordinator: AppCoordinator = {
        let coordinator = AppCoordinator()
        return coordinator
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }
}

