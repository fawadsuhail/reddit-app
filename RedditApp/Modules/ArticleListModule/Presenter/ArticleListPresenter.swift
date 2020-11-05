import Foundation
import Promises

class ArticleListPresenter {
    weak var view: ArticleListVC?
    var interactor: ArticleListInteractor?
    var router: ArticleListRouter?
    private var articles = [Article]()

    func viewLoaded() {
        view?.showLoading()
        interactor?.fetchArticles().then { [weak self] articles in
            self?.view?.hideLoading()
            self?.articles = articles
            self?.updateView()
        }
    }

    func updateView() {
        let cellViewModels = articles.map({
            convertToArticleCellViewModel(article: $0)
        })
        view?.updateViewModels(viewModels: cellViewModels)
    }

    func didSelectArticle(with id: String) {
        guard let article = articles.filter({ $0.id == id }).first else {
            return
        }
        router?.showArticleDetail(with: article)
    }

    private func convertToArticleCellViewModel(article: Article) -> ArticleListCellViewModel {
        return ArticleListCellViewModel(id: article.id,
                                        title: article.title,
                                        thumbnail: article.thumbnail)
    }
}
