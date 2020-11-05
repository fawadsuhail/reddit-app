import Foundation
import UIKit

class ArticleListBuilder {
    func buildModule() -> UIViewController {
        let router = ArticleListRouter()
        let interactor = ArticleListInteractor()
        let presenter = ArticleListPresenter()
        let view = ArticleListVC()

        router.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter

        return view
    }
}
