import Foundation

protocol URLRequestable {
    func request() -> URLRequest
}

enum ArticleEndpoint: URLRequestable {
    case all

    private func asUrl() -> URL {
        let baseURL = "https://www.reddit.com"
        var url = URL(string: baseURL)!

        switch self {
        case .all:
            url = url.appendingPathComponent("r/swift/.json")
        }

        return url
    }

    func request() -> URLRequest {
        let request = URLRequest(url: asUrl())
        return request
    }
}
