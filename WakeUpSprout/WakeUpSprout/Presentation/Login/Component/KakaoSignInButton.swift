//
//  KakaoLoginButton.swift
//  WakeUpSprout
//
//  Created by 이부용 on 9/15/25.
//

import SwiftUI

struct KakaoLoginButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image("kakaoIcon")
                .resizable()
                .frame(height: 48)
                .frame(maxWidth: .infinity)
        }
    }
}
