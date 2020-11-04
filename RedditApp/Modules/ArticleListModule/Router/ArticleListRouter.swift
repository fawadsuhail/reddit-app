import Foundation
import UIKit

class ArticleListRouter: ArticleListRoutable {
    weak var view: UIViewController?

    func showArticleDetail(with article: Article) {
        let viewController = ArticleDetailBuilder().buildModule(with: article)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
