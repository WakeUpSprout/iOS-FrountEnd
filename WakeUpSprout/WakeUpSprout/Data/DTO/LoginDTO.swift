//
//  LoginDTO.swift
//  WakeUpSprout
//
//  Created by 이부용 on 10/10/25.
// 1. 서버 API 스펙에 맞춘 Request/Response 구조

import Foundation

// MARK: - Request DTO
struct LoginRequestDTO: Encodable {
    let provider: String
    let clientId: String
    let accessToken: String
    let idToken: String? // Kakao는 없음
    let profile: ProfileDTO
    
    enum CodingKeys: String, CodingKey {
        case provider
        case clientId = "client_id"
        case accessToken = "access_token"
        case idToken = "id_token"
        case profile
    }
}

// MARK: - Profile DTO
struct ProfileDTO: Codable {
    let name: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "Image" // 백엔드 요구사항
    }
}

// MARK: - Response DTO
struct LoginResponseDTO: Decodable {
    let userId: String
    let name: String
    let profileImageUrl: String?
    let provider: String
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case profileImageUrl = "profile_image_url"
        case provider
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
    
    // DTO -> Domain Entity 변환
    func toDomain() -> User {
        return User(
            id: userId,
            name: name,
            profileImageUrl: profileImageUrl,
            provider: LoginProvider(rawValue: provider) ?? .apple)
    }
}
