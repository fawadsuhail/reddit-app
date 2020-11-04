import Foundation
import Promises

class ArticleListInteractor {
    func fetchArticles() -> Promise<[Article]> {
        NetworkService().articles().then { response in
            response.data.children.map({
                self.mapToArticle(apiArticle: $0.data)
            })
        }.catch { error in
            print("the network error was \(error)")
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
                             createdUtc: apiArticle.createdUtc)
        return object
    }
}
