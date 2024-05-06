import SwiftUI
import SwiftData

struct GrapeView: View {
    @EnvironmentObject var grapeViewModel: GrapeViewModel
    @Query private var todos: [Todo]
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            VStack(spacing: -10) {
                ForEach(grapeViewModel.grapes.indices, id: \.self) { rowIndex in
                    HStack(spacing: -15) {
                        ForEach(grapeViewModel.grapes[rowIndex], id: \.id) { grapes in
                            Circle()
                                .fill(grapes.isCompleted ? Color(hex: "#BAF7AD") : Color(hex: "#F4F4F4"))
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }
        }
        .onAppear() {
            if !isLoaded {
                for _ in 0..<todos.count {
                    grapeViewModel.addGrapes()
                }

                if grapeViewModel.completedCount >= 16 {
                    for rowIndex in 0..<grapeViewModel.grapes.count {
                        for columnIndex in 0..<grapeViewModel.grapes[rowIndex].count {
                            grapeViewModel.grapes[rowIndex][columnIndex].isCompleted = true
                        }
                    }
                }
                isLoaded = true
            }
        }
        .onReceive(grapeViewModel.$completedCount) { newFinish in
            if newFinish > 0 && newFinish <= grapeViewModel.grapes.flatMap({ $0 }).count {
                var completedCount = 0
                for rowIndex in 0..<grapeViewModel.grapes.count {
                    for columnIndex in 0..<grapeViewModel.grapes[rowIndex].count {
                        if completedCount < newFinish {
                            grapeViewModel.grapes[rowIndex][columnIndex].isCompleted = true
                            completedCount += 1
                        } else {
                            grapeViewModel.grapes[rowIndex][columnIndex].isCompleted = false
                        }
                    }
                }
            } else if newFinish == 0 {
                for rowIndex in 0..<grapeViewModel.grapes.count {
                    for columnIndex in 0..<grapeViewModel.grapes[rowIndex].count {
                        grapeViewModel.grapes[rowIndex][columnIndex].isCompleted = false
                    }
                }
            }
        }
    }
}


#Preview {
    GrapeView()
        .environmentObject(GrapeViewModel())
}


