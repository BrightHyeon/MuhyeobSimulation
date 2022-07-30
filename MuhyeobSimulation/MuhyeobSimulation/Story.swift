//
//  Story.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

enum Rarity {
    case normal
    case rare
    case legend
    case hidden
}

enum SelectCase {
    case dismiss // 나가다. 지나치다. 다음으로. 등등 아무 결과없는 행위
    case runaway // 도망가다. 못본척하다. 등등 명성이 떨어지는 행위
    case participate // 돕는다.
    case fight
    case threaten // 위협하다. 가진 힘은 없으나, 명성은 높을 때 효과적
    case buy // 사먹는것, 치료받는 것, 구매하는 것 등.
}

struct Selection {
    let selectCase: SelectCase
}

struct Story {
    let rarity: Rarity
    let content: String
    let selections: [Selection]
}
