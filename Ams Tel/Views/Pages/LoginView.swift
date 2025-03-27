//
//  LoginView.swift
//  Ams Tel
//
//  Created by makrowave on 27/03/2025.
//

import SwiftUI

struct LoginView: View {
    let borderColor = Color(UIColor(named: "Border")!)
    @State var login: String = ""
    var body: some View {
            VStack {
                //Login
                Text("Login").multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(borderColor),
                        alignment: .bottom
                    )
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                TextField(text: $login, label: {Text("Login")})
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
            }
            .border(borderColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1)
            )
            .padding(10)
            //Password
            VStack {
                Text("Hasło").multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(borderColor),
                        alignment: .bottom
                    )
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                TextField(text: $login, label: {Text("Hasło")})
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
            }
            .border(borderColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1)
            )
            .padding(10)
            //Button
            NavigationLink(destination: TabLayout()) {
                Text("Zaloguj się")
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(borderColor, lineWidth: 1)
                        
                    )
            }.padding(10)
    }
}

#Preview {
    LoginView().preferredColorScheme(.light)
}
