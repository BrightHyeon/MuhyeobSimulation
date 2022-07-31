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
            Text(vm.currentStory.content)
                .padding()
            
            Spacer().frame(height: 70)
            
            ForEach(vm.currentStory.options, id: \.self) { selection in
                makeButton(selection)
            }
        }
        .onChange(of: vm.currentStory, perform: { newValue in
            vm.checkReward(vm.currentStory.rewards)
            print(vm.currentStory.rewards ?? Reward.highMoney)
        })
    }
    
    @ViewBuilder
    func makeButton(_ selection: Selection) -> some View {
        Button {
            vm.checkSelection(selection)
        } label: {
            Text(selection.title)
                .font(.title3)
                .fontWeight(.black)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                )
        }
    }
}

struct AView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(vm: StoryViewModel())
    }
}
