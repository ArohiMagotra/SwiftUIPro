//
//  Untitled.swift
//  SwiftUIPro
//
//  Created by Arohi Magotra on 06/01/26.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    let onLoginSuccess: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            title
            emailField
            passwordField
            errorView
            loginButton
        }
        .padding()
    }
}

private extension LoginView {

    var title: some View {
        Text("Welcome Back")
            .font(.largeTitle)
            .bold()
    }

    var emailField: some View {
        TextField("Email", text: $viewModel.email)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .textFieldStyle(.roundedBorder)
    }

    var passwordField: some View {
        SecureField("Password", text: $viewModel.password)
            .textFieldStyle(.roundedBorder)
    }

    @ViewBuilder
    var errorView: some View {
        if let error = viewModel.errorMessage {
            Text(error)
                .foregroundColor(.red)
                .font(.caption)
        }
    }

    var loginButton: some View {
        Button(action: loginTapped) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text("Login")
                    .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(.borderedProminent)
        .disabled(!viewModel.isFormValid || viewModel.isLoading)
    }

    func loginTapped() {
        Task {
            let success = await viewModel.login()
            if success {
                onLoginSuccess()
            }
        }
    }
}
