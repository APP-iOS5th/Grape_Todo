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
    @Published var completedCount: Int = 0  // Todo.completed 카운트
    @Query private var todos: [Todo]
    var currentId: Int = 1


    // add버튼을 눌렀을 때 포도알이 생성되는 총 항목 개수를 반환하는 계산된 프로퍼티
    var totalGrapesCount: Int {
        grapes.reduce(0) { $0 + $1.count }
    }

    var totalTodoCount: Int {   // Todo 배열의 항목 총 갯수 연산 프로퍼티
        todos.count
    }

    func deleteGrapes() {
        // grapes 배열이 비어있지 않은지 확인합니다.
        guard !grapes.isEmpty else { return }

        // grapes 배열의 마지막 내부 배열의 마지막 요소를 제거합니다.
        grapes[grapes.endIndex - 1].removeLast()

        // 내부 배열이 비어있는지 확인합니다.
        if grapes[grapes.endIndex - 1].isEmpty {
            // 외부 배열의 마지막 요소가 빈 배열이라면 해당 요소를 제거합니다.
            grapes.removeLast()
        }
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

//    func addGrapes() {
//        // 현재 포도알 수가 Todo 배열의 총 항목 수와 같아질 때까지 반복하여 포도알을 추가합니다.
//        while totalGrapesCount < totalTodoCount && totalGrapesCount < 15 {
//            // 현재 인덱스가 마지막 내부 배열의 인덱스보다 크거나 같다면 새로운 내부 배열을 추가합니다.
//            if currentId >= grapes[grapes.endIndex - 1].count {
//                grapes.append([])
//            }
//
//            // 새로운 포도알을 생성하여 현재 내부 배열에 추가합니다.
//            let newItem = GrapeModel(id: currentId, isCompleted: false)
//            grapes[grapes.endIndex - 1].append(newItem)
//
//            // 다음 포도알을 위해 현재 ID를 증가시킵니다.
//            currentId += 1
//        }
//    }
}
