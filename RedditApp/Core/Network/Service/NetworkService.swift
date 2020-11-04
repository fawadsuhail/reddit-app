import Foundation
import Promises

public enum NetworkError: String, Error {
    case parsing = "A parsing error occurred"
    case generic = "An error occurred"
}

class NetworkService {
    func makeRequest<T: Decodable>(with urlRequest: URLRequestable, decodeType: T.Type) -> Promise<T> {
        return sendRequest(with: urlRequest).then { data in
            self.decode(modelType: T.self, from: data)
        }
    }
    
    private func sendRequest(with urlRequest: URLRequestable) -> Promise<Data> {
        let promise = Promise<Data>.pending()
        let task = URLSession.shared.dataTask(with: urlRequest.request(), completionHandler: { data, response, error in
            if let error = error {
                promise.reject(error)
            }
            if let data = data {
                promise.fulfill(data)
            }
        })
        task.resume()

        return promise
    }

    private func decode<T: Decodable>(modelType: T.Type, from data: Data) -> Promise<T> {
        return Promise<T>(on: .global(qos: .background), { fullfill, reject in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                fullfill(decodedData)
            } catch {
                reject(NetworkError.parsing)
            }
        })
    }
}

extension NetworkService {
    public func articles() -> Promise<APIArticleResponse> {
        return makeRequest(with: ArticleEndpoint.all,
                           decodeType: APIArticleResponse.self)
    }
}
