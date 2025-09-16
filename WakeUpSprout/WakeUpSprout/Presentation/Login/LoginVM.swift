//
//  LoginVM.swift
//  WakeUpSprout
//
//  Created by 이부용 on 9/15/25.
//

import SwiftUI
import RxSwift

class LoginVM: ObservableObject {
    // === 로그인 버튼 클릭 이벤트 ===
    let appleLoginTapped = PublishSubject<Void>()
    let googleLoginTapped = PublishSubject<Void>()
    let kakaoLoginTapped = PublishSubject<Void>()
}
