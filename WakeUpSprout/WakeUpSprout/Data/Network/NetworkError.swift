//
//  NetworkError.swift
//  WakeUpSprout
//
//  Created by 이부용 on 10/10/25.
// 1. 네트워크 에러 정의

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int, message: String?)
    case unknown(Error)
    
    var description: String {
        switch self {
        case .invalidURL:
            return "잘못된 URL 입니다."
        case .noData:
            return "데이터를 받지 못했습니다."
        case .decodingError:
            return "데이터 파싱에 실패했습니다."
        case .serverError(statusCode: let code, message: let message):
            return "서버 오류 (\(code)): \(message ?? "알 수 없는 오류")"
        case .unknown(let error):
            return "알 수 없는 오류: \(error.localizedDescription)"
        }
    }
}
