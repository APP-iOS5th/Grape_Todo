////
////  GrapeViewModel.swift
////  GrapeTodo
////
////  Created by 김승원 on 5/2/24.
////
//
import SwiftUI
import SwiftData

class GrapeViewModel: ObservableObject {
    @Published var grapes: [[GrapeModel]] = [[]]
    var currentId: Int = 1


    // 총 항목 개수를 반환하는 계산된 프로퍼티
    var totalItemCount: Int {
        grapes.reduce(0) { $0 + $1.count }
    }

    func addGrapes() {
//        // 배열의 총 항목 수를 계산합니다.
//        let totalItemCount = grapes.reduce(0) { $0 + $1.count }
//
//        // 총 항목 수가 15를 초과하는지 확인합니다.
//        if totalItemCount >= 15 {
//            return // 총 항목 수가 15를 초과하면 더 이상 배열을 생성하지 않습니다.
//        }
//
        print("addPodal() 함수가 실행됐어")
        if grapes[grapes.endIndex - 1].count >= (6 - grapes.count) {
            grapes.append([])
        }

        print("currentId: \(currentId)")
        let newItem = GrapeModel(id: currentId, isCompleted: false)
        grapes[grapes.endIndex - 1].append(newItem)
        currentId += 1

    }
}
