////
////  GrapeView.swift
////  GrapeTodo
////
////  Created by 김승원 on 5/2/24.
////
//
import SwiftUI
import SwiftData

struct GrapeView: View {
    @EnvironmentObject var grapeViewModel: GrapeViewModel  // @ObservedObject,  @EnvironmentObject
    @Query private var todos: [Todo]

    var body: some View {
        //        GeometryReader { geometry in
        //            VStack(spacing: -10) {
        //                ForEach(todos, id: \.id) { todo in
        //                    Circle()
        //                        .fill(todo.completed ? Color.green : Color.gray)
        //                        .stroke(Color.white, lineWidth: 2)
        //                        .frame(width: 40, height: 40) // Circle의 크기를 고정값으로 설정
        //                        .padding(.horizontal, 5) // 각 원 사이에 일정한 간격 추가
        //                }
        //                Spacer()
        //            }
        //            .padding(.top, 10)
        //            .frame(maxWidth: .infinity, maxHeight: .infinity) // 최대 크기 설정
        //        }

        ZStack {
            VStack(spacing: -10) {
                ForEach(grapeViewModel.grapes.indices, id: \.self) { rowIndex in   // 행
                    HStack(spacing: -15) {  // 층
                        ForEach(grapeViewModel.grapes[rowIndex], id: \.id) { grapes in   // 열
                            Circle()
                                .fill(grapes.isCompleted ? Color.green : Color.gray)
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 40, height: 40)
                        }
                    }

                }
                Spacer()
            }
            .padding(.top, 10)
        }

        // 2차원 배열의 행과 열 인덱스 확인하기
//        Text("총 \(grapeViewModel.totalItemCount)개의 항목이 있습니다.")

    } // body }
}   // View }




//
//        // completedFinish가 변경될 때마다 실행됨
//        .onReceive(listViewModel.$completedFinish) { newFinish in
//            // 만약 newFinish가 0보다 크고 grape 배열의 총 항목 수보다 작거나 같다면
//            if newFinish > 0 && newFinish <= podoalViewModel.podoals.flatMap({ $0 }).count {
//                var completedCount = 0 // 완료된 항목의 개수를 변수로 초기화한다.
//                for rowIndex in 0..<podoalViewModel.podoals.count {   // grape 배열의 행(row)을 반복한다.
//                    for columnIndex in 0..<podoalViewModel.podoals[rowIndex].count {  // 각 헹의 열(column)를 반복한다.
//                        // 완료된 항목의 개수가 newFinish보다 작다면
//                        if completedCount < newFinish {
//                            // 해당 항목의 isCompleted를 true로 설정하고,
//                            podoalViewModel.podoals[rowIndex][columnIndex].isCompleted = true
//                            // 완료된 항목의 개수를 증가시킨다.
//                            completedCount += 1
//                        } else {
//                            // 그렇지 않으면 해당 항목의 isCompleted를 false로 설정한다.
//                            podoalViewModel.podoals[rowIndex][columnIndex].isCompleted = false
//                        }
//                    }
//                }
//            } else if newFinish == 0 {
//                // 만약 newFinish가 0이라면,
//                // grape 배열의 모든 항목의 isCompleted를 false로 설정한다.
//                for rowIndex in 0..<podoalViewModel.podoals.count {
//                    for columnIndex in 0..<podoalViewModel.podoals[rowIndex].count {
//                        podoalViewModel.podoals[rowIndex][columnIndex].isCompleted = false
//                    }
//                }
//            }
//        }
//
//    }
//}
//
//
//#Preview {
//    GrapeView(podoalViewModel: PodoalViewModel(), listViewModel: ListViewModel())
//}
//
