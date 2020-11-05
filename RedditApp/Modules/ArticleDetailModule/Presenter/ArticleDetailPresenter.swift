import Foundation

class ArticleDetailPresenter {
    var interactor: ArticleDetailInteractor?
    weak var view: ArticleDetailVC?
    private let article: Article

    init(article: Article) {
        self.article = article
    }

    func viewLoaded() {
        let viewModel = convertToArticleDetailViewModel(article: article)
        view?.update(with: viewModel)
    }

    private func convertToArticleDetailViewModel(article: Article) -> ArticleDetailViewModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        return ArticleDetailViewModel(viewTitle: article.title,
                                      title: article.title,
                                      selftext: article.selftext,
                                      thumbnail: article.thumbnail,
                                      commentText: "\(article.numComments) comments",
                                      dateText: dateFormatter.string(from: article.createdUtc))
    }
    
}
