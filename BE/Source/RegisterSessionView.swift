//
//  RegisterSessionView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct RegisterSessionView: View {
    
    @State var isCompleted: Bool = false
    @State var selectedSession: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("오전/오후반이신가요?")
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }

                // Session Button Container
                HStack {
                    SessionSelectionButton(
                        sessionName: "오전반",
                        selectedSession: $selectedSession
                    )
                    
                    SessionSelectionButton(
                        sessionName: "오후반",
                        selectedSession: $selectedSession
                    )
                }

                Spacer()

                NavigationLink(destination: ContentView(), isActive: $isCompleted) {
                    EmptyView()
                }
                
            }//VStack
            .padding(.horizontal, 20)
        }// NavigationView
    }// body
}// RegisterSessionView

struct RegisterSessionView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSessionView()
    }
}

// MARK: - 세션 선택 버튼
struct SessionSelectionButton: View {
    
    let sessionName: String
    
    @Binding var selectedSession: String
    
    var body: some View {
        Button(action: {
            selectedSession = sessionName
        }) {
            Text(sessionName)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding(.vertical, 27)
                .padding(.horizontal, 56)
                .background(selectedSession == sessionName ? .red : .gray)
                .cornerRadius(12)
        }

    }// body
}// SessionSelectionButton
