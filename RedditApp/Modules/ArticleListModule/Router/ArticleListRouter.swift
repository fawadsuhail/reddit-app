import Foundation
import UIKit

class ArticleListRouter {
    weak var view: UIViewController?

    func showArticleDetail(with article: Article) {
        let viewController = ArticleDetailBuilder().buildModule(with: article)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }

    func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        view?.present(alert, animated: true, completion: nil)
    }
}
