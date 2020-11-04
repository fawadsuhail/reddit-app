import Foundation

class ArticleDetailPresenter {
    var interactor: ArticleDetailInteractor?
    weak var view: ArticleDetailVC?
    private let article: Article

    init(article: Article) {
        self.article = article
    }
}
