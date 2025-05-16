//
//  LoginView.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/12/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    var navigateToHome: () -> Void
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLogin = true

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(isLogin ? "Log In" : "Sign Up")
                    .font(.custom("IndieFlower", size: 34))
                    .bold()

                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .font(.custom("IndieFlower", size: 18))
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .font(.custom("IndieFlower", size: 18))
                    .cornerRadius(8)

                Button(action: {
                    handleAuth()
                }) {
                    Text(isLogin ? "Log In" : "Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.custom("IndieFlower", size: 18))
                        .background(Color.gray.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    isLogin.toggle()
                }) {
                    Text(isLogin ? "Don't have an account? Sign Up" : "Already have an account? Log In")
                        .font(.custom("IndieFlower", size: 13))
                        .foregroundColor(.gray)
                }

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.custom("IndieFlower", size: 12))
                }
            }
            .padding()
        }
    }

    func handleAuth() {
        if isLogin {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    errorMessage = ""
                    if let user = result?.user {
                        print("✅ Logged in as \(user.email ?? "")")
                        navigateToHome()
                    }
                }
            }
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    errorMessage = ""
                    if let user = result?.user {
                        print("✅ Signed up as \(user.email ?? "")")
                        navigateToHome()
                    }
                }
            }
        }
    }
}
