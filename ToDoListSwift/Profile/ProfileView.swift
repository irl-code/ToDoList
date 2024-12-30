//
//  ProfileView.swift
//  ToDoListSwift
//
//  Created by Hamza Wahab on 29/12/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            if let user = viewModel.currentUser {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .foregroundStyle(.white)
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)

                                Text(user.email)
                                    .font(.footnote)
                                    .accentColor(.gray)
                            }
                        }
                    }
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    Section("Account") {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                        }
                        Button {
                            print("delete account...")
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                        }
                    }
                }
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}