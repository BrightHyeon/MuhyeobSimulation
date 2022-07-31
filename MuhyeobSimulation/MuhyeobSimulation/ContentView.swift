//
//  ContentView.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = StoryViewModel()
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.orange
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("무협 시뮬레이션")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                Spacer().frame(height: 50)
                VStack {
                    StoryView(vm: vm)
                    Spacer()
                }
                .padding(10)
                .background(.red)
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
