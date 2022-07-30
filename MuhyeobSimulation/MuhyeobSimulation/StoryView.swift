//
//  AView.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

struct StoryView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
            Button {
                
            } label: {
                Text("바꿔")
            }
        }
    }
}

struct AView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(title: "ji")
    }
}
