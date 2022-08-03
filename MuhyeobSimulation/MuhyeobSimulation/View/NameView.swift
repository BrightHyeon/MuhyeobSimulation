//
//  NameView.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/08/01.
//

import SwiftUI

struct NameView: View {
    
    @StateObject var vm = StoryViewModel()
    @State private var text: String = ""
    @State private var isPush: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("유저 이름")
                        .font(.title2.bold())
                    
                    TextField("이름 입력", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.black)
                    
                    Spacer().frame(height: 50)

                    Button {
                        vm.userName = text
                        isPush.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Text("시작하기")
                                .padding()
                            Spacer()
                        }
                    }
                }
                .foregroundColor(.white)
                .padding()
                
                NavigationLink(isActive: $isPush) {
                    MainView(vm: vm)
                        .navigationBarHidden(true)
                } label: {}
            }
            .navigationBarHidden(true)
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
