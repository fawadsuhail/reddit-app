import Foundation
import UIKit

class ArticleDetailBuilder {
    func buildModule(with article: Article) -> UIViewController {
        let presenter = ArticleDetailPresenter(article: article)
        let view = ArticleDetailVC()

        view.presenter = presenter
        presenter.view = view

        return view
    }
}
