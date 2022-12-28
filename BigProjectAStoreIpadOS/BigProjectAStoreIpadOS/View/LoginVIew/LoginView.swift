//
//  LoginView.swift
//  BigProjectAStoreIpadOS
//
//  Created by 이주희 on 2022/12/28.
//

import SwiftUI

struct LoginView: View {
    @State var userID = ""
    @State var userPassword = ""
    @Binding var isShownFullScreenCover: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("아이디", text: $userID)
                    .textCase(.lowercase)
                    .disableAutocorrection(true)
                    .modifier(LoginFieldModifier())
                
                SecureField("비밀번호", text: $userPassword)
                    .modifier(LoginFieldModifier())
                    .padding(.bottom, 30)
                
                Button {
                    isShownFullScreenCover = false
                    
                } label: {
                    Text("로그인")
                }.frame(width: 430, height: 50)
                    .background(.gray)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("회원가입")
                }
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
        }
    }
}

struct LoginFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 400)
            .padding()
            .border(.gray)
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
