import SwiftUI
import SwiftData

struct TodoView: View {
    @State var showingFixTodo = false

    @State var showingTodoDetail = false
    @EnvironmentObject var grapeViewModel: GrapeViewModel

    @State private var todo: Todo
    public init(todo: Todo) {
        self.todo = todo
    }

    var body: some View {
        NavigationStack{
            HStack(){
                Button(action: toggleCompleted) {
                    Circle()
                        .fill(todo.completed ? Color(hex: "#BAF7AD") : Color(hex: "#F4F4F4"))
                        .frame(width : 20)
                }.buttonStyle(.borderless)
                Text(todo.content)
                    .foregroundColor(todo.completed ? .secondary : .primary)

                Spacer()
                Text("(todo.priority)")
                Spacer()

                Button(action: {showingFixTodo = true}) {
                    Image(systemName: "chevron.right")
                }.buttonStyle(.plain).sheet(isPresented:$showingFixTodo) {FixTodoView(todo: $todo)}
            }
        }
    }

    private func toggleCompleted() {
        todo.completed.toggle()
        if todo.completed {
            grapeViewModel.completedCount += 1
        } else {
            grapeViewModel.completedCount -= 1
        }
    }
}
