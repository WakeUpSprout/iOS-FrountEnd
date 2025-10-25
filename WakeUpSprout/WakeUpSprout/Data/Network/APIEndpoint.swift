//
//  APIEndpoint.swift
//  WakeUpSprout
//
//  Created by 이부용 on 10/10/25.
// 1. API 엔드포인트 정의 (URL, Method, Parameters, Headers를 한 곳에서 관리함)

import Alamofire
import Foundation

enum APIEndpoint {
    case appleLogin(request: LoginRequestDTO)
    case googleLogin(request: LoginRequestDTO)
    case kakaoLogin(request: LoginRequestDTO)
    case logout
    
    // MARK: Base URL
    private var baseURL: String {
        return ""
    }
    
    // MARK: Path
    var path: String {
        switch self {
        case .appleLogin:
            return "/auth/apple"
        case .googleLogin:
            return "/auth/google"
        case .kakaoLogin:
            return "/auth/kakao"
        case .logout:
            return "/auth/logout"
        }
    }
    
    // MARK: Full URL
    var url: String {
        return baseURL + path
    }
    
    // MARK: HTTP Method
    var method: HTTPMethod {
        switch self {
        case .appleLogin, .googleLogin, .kakaoLogin, .logout:
            return .post
        }
    }
    
    // MARK: Parameters
    var parameters: Parameters? {
        switch self {
        case .appleLogin(let request),
             .googleLogin(let request),
             .kakaoLogin(let request):
            return request.toDictionary()
            
        case .logout:
            return nil
        }
    }
    
    // MARK: Headers
    var headers: HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        // 로그아웃 시 토큰 필요
        if case .logout = self {
            if let token = UserDefaults.standard.string(forKey: "accessToken") {
                headers.add(.authorization(bearerToken: token))
            }
        }
        return headers
    }
}

// MARK: - Encodable Extension
extension Encodable {
    func toDictionary() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
            .flatMap { $0 as? [String: Any] }
    }
}
