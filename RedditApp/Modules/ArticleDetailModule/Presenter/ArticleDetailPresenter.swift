import Foundation

class ArticleDetailPresenter {
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
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return ArticleDetailViewModel(viewTitle: article.title,
                                      title: article.title,
                                      selftext: article.selftext,
                                      thumbnail: article.thumbnail,
                                      dateText: dateFormatter.string(from: article.createdUtc))
    }
}
