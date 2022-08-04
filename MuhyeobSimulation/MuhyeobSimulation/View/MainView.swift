//
//  ContentView.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm: StoryViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("무협 시뮬레이션")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding()
                VStack(alignment: .leading) {
                    HStack {
                        Text("체력:")
                        Text("\(vm.user.userHealth)")
                        Text("파워:")
                        Text("\(Int(vm.user.userPower))")
                    }
                    HStack {
                        Text("돈:")
                        Text("\(vm.user.userMoney)")
                        Text("명성:")
                        Text("\(vm.user.userPopularity)")
                    }
                    HStack {
                        Text("소지품:")
                        ForEach(vm.user.collectedItems, id: \.self) { item in
                            Text(item)
                        }
                    }
                }.padding()
                Spacer().frame(height: 20)
                ScrollView {
                    StoryView(vm: vm)
                        .frame(width: UIScreen.main.bounds.width)
                }
                .background(.white)
                .foregroundColor(.black)
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: StoryViewModel())
    }
}
