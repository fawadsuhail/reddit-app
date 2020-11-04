import Foundation
import UIKit

class ArticleDetailBuilder {
    func buildModule(with article: Article) -> UIViewController {
        let interactor = ArticleDetailInteractor()
        let presenter = ArticleDetailPresenter(article: article)
        let view = ArticleDetailVC()

        view.presenter = presenter
        presenter.interactor = interactor

        return view
    }
}
