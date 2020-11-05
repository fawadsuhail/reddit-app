import Foundation
import UIKit

class ArticleListRouter {
    weak var view: UIViewController?

    func showArticleDetail(with article: Article) {
        let viewController = ArticleDetailBuilder().buildModule(with: article)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
