import Foundation
import Promises

class ArticleListPresenter {
    weak var view: ArticleListVC?
    var interactor: ArticleListInteractor?
    var router: ArticleListRouter?
    private var articles = [Article]()

    func viewLoaded() {
        interactor?.fetchArticles().then { [weak self] articles in
            self?.articles = articles
            self?.updateView()
        }
    }

    func updateView() {
        let cellViewModels = articles.map({
            convertToArticleCellViewModel(article: $0)
        })
        view?.updateViewModels(cellViewModels: cellViewModels)
    }

    private func convertToArticleCellViewModel(article: Article) -> ArticleListCellViewModel {
        return ArticleListCellViewModel(id: article.id,
                                        title: article.title,
                                        thumbnail: article.thumbnail)
    }
}
