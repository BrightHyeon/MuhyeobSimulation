//
//  Story.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

// id: 고유의 식별자
// content: 스토리 내용
// reward: Optinal. 해당 스토리에 갖는 보상
// options: 각 선택지
// Equatable: .onChange를 쓰려면 Story모델이 비교가능한 것이어야 한다.
struct Story: Equatable, Codable {
    let id: UUID
    let content: String
    let rewards: [Reward]?
    let options: [Selection]
}

// title: 선택지의 제목
// selectCase: 선택지 성격
// nextId: Optinal. 이어지는 스토리의 식별자
struct Selection: Hashable, Codable {
    let title: String
    let selectCase: SelectCase
    let nextId: UUID?
    let ifFail: UUID?
}

// 선택지 성격 타입
// normal: 연관값이 필요없는 보통의 케이스
// fight: 곧 싸우게 될 적의 power를 연관값으로 갖는 케이스
// threaten: 마주한 적의 담력값을 연관값으로 갖는 케이스
enum SelectCase: Hashable, Codable {
    case normal
    case fight(enemyPower: Double)
    case threaten(enemyCourage: Double)
}

// 보상
enum Reward: String, Codable {
    // 힘
    case powerUp // 10~30
    case powerUpUp // 100~300
    // 명성
    case popularUp // + 1
    case popularDown // - 1
    // 금전
    case lowMoney // 10~30
    case midMoney // 50~100
    case highMoney // 150~300
    // 무기
    case normalWeapon
    case rareWeapon
    case epicWeapon
    case legendWeapon // 단 1개
    // 약 & 영약
    case plaque
    // 무공비급, 심법
    // ...
    case healthUp
    case healthDown
}

enum UserClass: String {
    case third
    case second
    case first
    case climax
    case superClimax
    case hwagyeong
    case hyeongyeong
    case god
}
