//
//  Enemy.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/08/04.
//

import Foundation

struct Enemy: Hashable, Codable {
    let type: Personality
    let power: Double
}

// 상대의 성향
enum Personality: String, Hashable, Codable {
    case evil
    case middle
    case good
}
