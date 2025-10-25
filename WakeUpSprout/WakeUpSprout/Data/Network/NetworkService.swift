//
//  NetworkService.swift
//  WakeUpSprout
//
//  Created by 이부용 on 10/10/25.
// 1. Alamofire 사용(Rxswift 래핑) - Generic으로 모든 API 호출을 처리

import Alamofire
import RxSwift

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    // MARK: - Generic Request (Response 있음)
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) -> Single<T> {
        return Single.create { single in
            AF.request(
                endpoint.url,
                method: endpoint.method,
                parameters: endpoint.parameters,
                encoding: JSONEncoding.default,
                headers: endpoint.headers
            )
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    single(.success(data))
                    
                case .failure(let error):
                    if let statusCode = response.response?.statusCode,
                       let data = response.data,
                       let errorMessage = String(data: data, encoding: .utf8) {
                        single(.failure(NetworkError.serverError(
                            statusCode: statusCode,
                            message: errorMessage
                        )))
                    } else {
                        single(.failure(NetworkError.unknown(error)))
                    }
                }
            }
            return Disposables.create()
        }
    }
    
    // MARK: - Completable Request (Response 없음)
    func requestCompletable(endpoint: APIEndpoint) -> Completable {
        return Completable.create { completable in
            AF.request(
                endpoint.url,
                method: endpoint.method,
                parameters: endpoint.parameters,
                encoding: JSONEncoding.default,
                headers: endpoint.headers
            )
            .validate()
            .response { response in
                if let error = response.error {
                    completable(.error(NetworkError.unknown(error)))
                } else {
                    completable(.completed)
                }
            }
            return Disposables.create()
        }
    }
}
