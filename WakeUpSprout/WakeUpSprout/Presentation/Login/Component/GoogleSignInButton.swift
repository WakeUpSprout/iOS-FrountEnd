//
//  GoogleSignInButton.swift
//  WakeUpSprout
//
//  Created by 이부용 on 9/15/25.
//

import SwiftUI

struct GoogleSignInButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image("googleIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Sign in with Google")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
            }
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}
