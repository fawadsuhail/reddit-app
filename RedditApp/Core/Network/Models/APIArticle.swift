import Foundation

struct APIArticleResponse: Codable {
    var data: APIArticleChildrenResponse
}

struct APIArticleChildrenResponse: Codable {
    var children: [APIArticleChildObject]
}

struct APIArticleChildObject: Codable {
    var data: APIArticle
}

struct APIArticle: Codable {
    var id: String
    var title: String
    var selftext: String?
    var thumbnail: String?
    var numComments: Int
    var createdUtc: Double
}
