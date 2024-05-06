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
    
    @Published
    var grapes: [[Grape]] = []
    
    @Published
    var completedCount: Int = 0

    var currentId: Int = 1
    var totalGrapesCount: Int {
        grapes.reduce(0) { $0 + $1.count }
    }

    func addGrapesCount(todosCount: Int) -> Int {
        return todosCount - grapes.count * 6
    }

    func deleteGrapes() {
        guard !grapes.isEmpty else { return }

        if !grapes[grapes.endIndex - 1].isEmpty {
            grapes[grapes.endIndex - 1].removeLast()
        }

        if grapes.last?.isEmpty == true {
            grapes.removeLast()
        }
    }

    func addGrapes() {
        let totalGrapes = grapes.flatMap{ $0 }.count
        if totalGrapes >= 15 {
            return
        }

        if grapes.isEmpty || grapes.last?.count ?? 0 >= (6 - grapes.count) {
            grapes.append([Grape(id: currentId, isCompleted: false)])
        } else {
            grapes[grapes.endIndex - 1].append(Grape(id: currentId, isCompleted: false))
        }
        currentId += 1
    }
}
