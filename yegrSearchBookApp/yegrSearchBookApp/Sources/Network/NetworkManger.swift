//
//  NetworkManger.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/9/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func searchBookAPI(query: String, completion: @escaping (BookResult) -> Void) {
        let urlString = "https://dapi.kakao.com/v3/search/book"
        guard let url = URL(string: urlString) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        // 파라미터 설정
        let qureyParam = URLQueryItem(name: "query", value: query)
        let languageParam = URLQueryItem(name: "language", value: "ko-KR")
        let queryItems = [qureyParam, languageParam]
        components?.queryItems = queryItems
        
        guard let componentUrl = components?.url else { return }
        var urlRequest = URLRequest(url: componentUrl)
        
        // 해더 설정
        urlRequest.allHTTPHeaderFields = [
            "Authorization": "KakaoAK 4a717dc6ab7f2f421969d4279073aa0e"
        ]
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let bookResult = try JSONDecoder().decode(BookResult.self, from: data)
                completion(bookResult)
            }
            catch {
                print("디코딩 에러 발생: \(error)")
            }
        }
        .resume()
    }
}
