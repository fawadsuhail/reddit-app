import Foundation
import Promises

class ArticleListInteractor: ArticleListInteractable {
    func fetchArticles() -> Promise<[Article]> {
        return NetworkService().articles().then { response in
            response.data.children.map({
                self.mapToArticle(apiArticle: $0.data)
            })
        }
    }

    private func mapToArticle(apiArticle: APIArticle) -> Article {
        var thumbnail: String?
        if let thumbnailUrlString = apiArticle.thumbnail,
           thumbnailUrlString.contains("https://") {
            thumbnail = apiArticle.thumbnail
        }
        let object = Article(id: apiArticle.id,
                             title: apiArticle.title,
                             selftext: apiArticle.selftext,
                             thumbnail: thumbnail,
                             numComments: apiArticle.numComments,
                             createdUtc: Date(timeIntervalSince1970: apiArticle.createdUtc))
        return object
    }
}
