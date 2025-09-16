//
//  LoginV.swift
//  WakeUpSprout
//
//  Created by 이부용 on 9/15/25.
//

import SwiftUI
import RxSwift
import AuthenticationServices

struct LoginV: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var vm = LoginVM()
    
    // MARK: - Component
    private let disposeBag = DisposeBag()
    private let buttonWidth: CGFloat = UIScreen.main.bounds.width - 80
    private let buttonHeight: CGFloat = 48
    
    // MARK: - View
    
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // === 상단 캐릭터 이미지 ===
            Image("mainCharacter")
                .resizable()
                .frame(width: 110, height: 160)
                .padding(.bottom, 30)
            
            // === 타이틀 & 설명 ===
            Text("깨워줘, 새싹! 입니다.")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.primary)
                .padding(.bottom, 6)
            Text("서비스 이용을 위해 로그인해주세요.")
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .padding(.bottom, 70)
            
            VStack(spacing: 16) {
                AppleSignInButton(colorScheme: colorScheme) {
                    vm.appleLoginTapped.onNext(())
                }
                .frame(width: buttonWidth, height: buttonHeight)
                .id(colorScheme)

                GoogleSignInButton {
                    vm.googleLoginTapped.onNext(())
                }
                .frame(width: buttonWidth, height: buttonHeight)

                KakaoLoginButton {
                    vm.kakaoLoginTapped.onNext(())
                }
                .frame(width: buttonWidth, height: buttonHeight)

            }
            .padding(.horizontal, 24)
                
                Spacer()
            }
        .onAppear {
            vm.appleLoginTapped.subscribe(onNext: { print("Apple 로그인 클릭 확인") }).disposed(by: disposeBag)
            vm.googleLoginTapped.subscribe(onNext: { print("Google 로그인 클릭 확인") }).disposed(by: disposeBag)
            vm.kakaoLoginTapped.subscribe(onNext: { print("Kakao 로그인 클릭 확인") }).disposed(by: disposeBag)
        }
    }
}

struct LoginV_Previews: PreviewProvider {
    static var previews: some View {
        LoginV()
    }
}

