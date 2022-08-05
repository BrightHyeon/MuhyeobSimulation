//
//  User.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/08/04.
//

import Foundation

struct User {
    var userName: String = ""
    var userClass: UserClass = .third
    var userHealth: Double = 100.0
    var userExternal: Double = 10.0
    var userInternal: Double = 10.0
    var userPower: Double = 100.0
    var userMoney: Int = 10
    var userPopularity: Int = 0
    var userUndestanding: Int = 0
    var collectedItems: [String] = []
    var collectedTitles: [String] = []
}

// 경지
enum UserClass: String, CaseIterable {
    case third // 삼류
    case second // 이류
    case first // 일류
    case climax // 절정
    case superClimax // 초절정
    case hwagyeong // 화경
    case hyeongyeong // 현경
    case god // 입신경
    case unknown
}
