import Foundation
import Promises

protocol ArticleListRoutable: class {
    func showArticleDetail(with article: Article)
}

protocol ArticleListPresentable: class {
    var view: ArticleListViewable? { get set }
    var router: ArticleListRoutable? { get set }
    var interactor: ArticleListInteractable? { get set }

    func viewLoaded()
    func didSelectArticle(with id: String)
}

protocol ArticleListInteractable: class {
    func fetchArticles() -> Promise<[Article]>
}

protocol ArticleListViewable: class {
    var presenter: ArticleListPresentable? { get set }

    func showLoading()
    func hideLoading()
    func updateViewModels(viewModels: [ArticleListCellViewModel])
}
