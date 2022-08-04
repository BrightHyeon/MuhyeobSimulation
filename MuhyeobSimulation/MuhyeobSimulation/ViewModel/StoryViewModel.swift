//
//  Story.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/07/30.
//

import SwiftUI

class StoryViewModel: ObservableObject {
    
    // MARK: Published Properties
    
    @Published var user: User = User()
    
    @Published var currentStory = Story(
        id: UUID(),
        content: " 내 이름은 울랄라. \n\n 평범한 가문에서 태어났지만 누구보다 열심히 무공을 수련했고 이제 가문이란 울타리 밖으로 나갈 때가 되었다. \n\n \"울랄라. 내 아들.\n 이제 내가 가르칠 수 있는 것은 없다. 이제는 밖으로 나가 세상을 돌아볼 때가 되었다.\n 바깥에서 무사수행을 통해 협의가 무엇인지 보여주거라. 너라면 잘할 수 있을 거다.\"\n\n 아버지는 항상 투정부리지않고 열심히 수련을 한 내가 대견하다는 듯이 바라보셨다. \n\n \"네 아버지. 세상을 돌아다니며 많은 것을 느끼고 오겠습니다.\"\n\n 말을 마친 뒤, 나는 대문 밖으로 나섰다. \n\n '나는 대협이 될 것이다...'",
        rewards: nil,
        options: [
            Selection(title: "무사수행 시작하기", selectCase: .normal, nextId: nil, ifFail: nil)
        ])
    
    var epicBases: [Story] = []
    var stories: [Story] = []
    
    init() {
        stories = loadJson("stories.json")
        epicBases = loadJson("epicBases.json")
        print("Stories: \(stories)")
        print("normalBases: \(epicBases)")
    }
    
    func checkSelection(_ selection: Selection) {
        switch selection.selectCase {
        case .normal:
            print("Normal Selection")
            if let nextId = selection.nextId {
                self.currentStory = stories.first(where: { story in
                    story.id == nextId
                })!
            } else {
                self.currentStory = epicBases.randomElement()!
            }
        case .fight(enemyPower: let enemyPower):
            print("Fight Selection")
            if isWin(enemyPower: enemyPower) {
                self.currentStory = stories.first(where: { story in
                    story.id == selection.nextId
                })!
            } else {
                self.currentStory = stories.first(where: { story in
                    story.id == selection.ifFail
                })!
            }
        case .threaten(enemyCourage: let enemyCourage):
            print("Threaten Selection \(enemyCourage)")
        }
    }
    
    private func isWin(enemyPower: Double) -> Bool {
        let winPercentage = user.userPower / (user.userPower + enemyPower) * 100
//        let winPercentage = self.power / (self.power + enemyPower) * 100
        print("WinPercentage: \(winPercentage)")
        let randomNum: Double = Double.random(in: 0...100)
        print("RandomNum: \(randomNum)")
        if randomNum < winPercentage {
            return true // win
        } else {
            return false // lose
        }
    }
    
    func checkReward(_ rewards: [Reward]?) {
        guard let rewards = rewards else { return }
        for reward in rewards {
            switch reward {
            case .powerUp:
                self.user.userPower += Double.random(in: 10...30)
            case .powerUpUp:
                self.user.userPower += Double.random(in: 100...300)
            case .popularUp:
                self.user.userPopularity += 1
            case .popularDown:
                self.user.userPopularity -= 1
            case .lowMoney:
                self.user.userMoney += 10
            case .midMoney:
                self.user.userMoney += 100
            case .highMoney:
                self.user.userMoney += 300
            case .healthDown:
                self.user.userHealth -= 30
            case .plaque:
                self.user.collectedItems += ["plaque"]
            default:
                break
            }
        }
    }
}

func loadJson<T: Codable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}

