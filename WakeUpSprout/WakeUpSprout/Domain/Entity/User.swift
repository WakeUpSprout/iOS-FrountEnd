//
//  User.swift
//  WakeUpSprout
//
//  Created by 이부용 on 10/10/25.
//

import Foundation

// MARK: - 사용자 모델
struct User {
    let id: String
    let name: String
    let profileImageUrl: String?
    let provider: LoginProvider
}

enum LoginProvider:String {
    case apple = "apple"
    case google = "google"
    case kakao = "kakao"
}

// MARK: - 소셜 로그인 기본 프로필 정보
struct SocialProfile {
    let name: String
    let imageUrl: String?
    
    init(name: String, imageUrl: String?) {
        self.name = name
        self.imageUrl = imageUrl
    }
}
