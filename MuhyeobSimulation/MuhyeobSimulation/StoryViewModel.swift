//
//  Story.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

class StoryViewModel: ObservableObject {
    
    @Published var health: Int = 100
    @Published var poss: Int = 100
    
    @Published var power: Int = 10
    @Published var popularity: Int = 0
    
    @Published var currentStory = Story(rarity: .normal,
                                        content: "무명가 출신의 나는 매일매일 명문가 자제들에게 괄시를 받으며 살아왔고 아버지 역시 나를 외면했다. 허나 나는 누구보다 강해지고싶었다. 어머니의 복수를 위해서라도...",
                                        selections: [Selection(selectCase: .dismiss)])
    
    var stories: [Story] = []
    
    let allNormal: [Story] = [
        Story(rarity: .normal, content: "하얗게 피어난 얼음꽃 하나", selections: [Selection(selectCase: .dismiss), Selection(selectCase: .fight)]),
        Story(rarity: .normal, content: "달가운 바람에 얼굴을 내밀어", selections: [Selection(selectCase: .runaway), Selection(selectCase: .fight)])
    ]
    
    let allRare: [Story] = [
    ]
    
    let allLegend: [Story] = [
    ]
    
    let allHidden: [Story] = [
    ]
    
}
