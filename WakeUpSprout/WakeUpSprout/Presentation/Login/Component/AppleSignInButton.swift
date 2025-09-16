//
//  AppleSignInButton.swift
//  WakeUpSprout
//
//  Created by 이부용 on 9/15/25.
//

import SwiftUI
import AuthenticationServices

struct AppleSignInButton: UIViewRepresentable {
    let colorScheme: ColorScheme
    var action: () -> Void
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let style: ASAuthorizationAppleIDButton.Style = (colorScheme == .dark) ? .white : .black
        let button = ASAuthorizationAppleIDButton(type: .signIn, style: style)
        button.addTarget(context.coordinator, action: #selector(Coordinator.didTapButton), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        // SwiftUI에서 받은 frame 크기대로 widthAnchor를 강제로 맞춤
        DispatchQueue.main.async {
            if let superview = uiView.superview {
                // 기존 widthAnchor constraint 제거
                superview.constraints.forEach { constraint in
                    if constraint.firstItem === uiView && constraint.firstAttribute == .width {
                        superview.removeConstraint(constraint)
                    }
                }
                // widthAnchor 새로 추가 (superview 기준)
                uiView.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }
    
    class Coordinator: NSObject {
        let action: () -> Void
        init(action: @escaping () -> Void) { self.action = action }
        @objc func didTapButton() { action() }
    }
}
