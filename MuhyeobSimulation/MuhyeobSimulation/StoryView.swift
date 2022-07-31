//
//  AView.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var vm: StoryViewModel
    
    var body: some View {
        VStack {
//            Text(vm.currentStory.content)
            Button {
//                vm.changeCurrentStory()
            } label: {
                Text("바꿔")
            }
        }
    }
}

struct AView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(vm: StoryViewModel())
    }
}
