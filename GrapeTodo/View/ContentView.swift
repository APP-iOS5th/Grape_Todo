//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {

    // SwiftData는 UI의 상태 변경 시 또는 특정 기간이 지난 후 컨텍스트를 스토어에 자동 저장한다. 하지만 원한다면 save()를 자유롭게 호출할 수 있다.
    @Environment(\.modelContext) private var modelContext // modelContext 객체를 이용하면 swiftData에서 제공하는 삽입,수정, 삭제 기능을 사용할 수 있음.
    @Query(sort: \Todo.createdAt, animation: .smooth) private var todos: [Todo]

    @StateObject var grapeViewModel: GrapeViewModel
    @State var showingAddTodo = false
//    @State var completedCount : Int = 5
    @State private var date = Date()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()

    var body: some View {
//        GrapeView(grapeViewModel: GrapeViewModel()).environmentObject(grapeViewModel)
        NavigationStack {

            GeometryReader{ geometry in
                VStack(spacing: 0){

                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(hex: "#D7DDDA"))
                            .frame(width: geometry.size.width * (8/9), height: geometry.size.height * (3/7))
                            .cornerRadius(25)

                        // 여기다 포도알 그려주면 됨, 임시 포도알 생성(위치확인용)

                        GrapeView().environmentObject(grapeViewModel)
//                        Text("하이")
//                        Text("\(todos.count)")  // todo 배열의 개수 확인용


                        GeometryReader { geometry in
                            Text("\(date, formatter: dateFormatter)")
                                .frame(width: geometry.size.width * 0.47, height: geometry.size.height * 0.33)
                                .font(.system(size: 20))
                                .foregroundStyle(Color.black)

//                            GrapesForCompletedTodos(completedCount: grapeViewModel.completedCount, geometry: geometry)
                        }
                    }

                    ListView
                        .onAppear {
                            grapeViewModel.completedCount = counter()
                        }
                        .navigationTitle("Todo")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                ActionBar
                            }
                        }
                        .sheet(isPresented: $showingAddTodo) {
                            AddTodoView()
                                .environmentObject(grapeViewModel)
                        }
                        .overlay {
                            if todos.isEmpty {
                                EmptyView.background()
                            }
                        }
                        .frame(height: geometry.size.height * (1/2))
                    Text("카운터: \(grapeViewModel.completedCount)")
                }

            }.tint(.orange)
        }
    }  // GeometryReader 괄호

    @ViewBuilder
    private var ListView: some View {
        List {
            ForEach(todos) { todo in
                TodoView(todo: todo)
                    .environmentObject(grapeViewModel)
            }
            .onDelete(perform: delete)
        }
    }

    @ViewBuilder
    private var ActionBar: some View {
        HStack {
            Spacer()
            Button {
                showingAddTodo = true
            } label: {
                Label("Add task", systemImage: "plus")
            }
            .buttonStyle(.borderless)
            .foregroundColor(.green)
        }
    }

    // Todo 목록이 하나도 없을때 해당 View가 나옴
    @ViewBuilder
    private var EmptyView: some View {
        ContentUnavailableView {
            Text("할 일을 추가하세요.").font(.system(size:17))
                .fontWeight(.regular)
        }
        .background(Color(hex: "#F2F2F7"))
    }

    private func counter() -> Int {
        var countComplete = 0
        for todo in todos {
            if todo.completed == true {
                countComplete += 1
            }
        }
        print("countComplete: \(countComplete)")
        return countComplete
    }

    // MARK: Data operations
    // 카운트만 뺄게 아니라 포도알 배열도 빼야함
    private func delete(indices: IndexSet) {
        for index in indices {
            let todo = todos[index]
            if todo.completed {
                grapeViewModel.completedCount -= 1
            }
            grapeViewModel.deleteGrapes()
            modelContext.delete(todo)
        }
    }
    
    private func counter() -> Int {
        var countComplete = 0
        for todo in todos {
            if todo.completed == true {
                countComplete += 1
            }
        }
        print(countComplete)
        return countComplete
    }
    
}

struct GrapesForCompletedTodos: View {
    var completedCount : Int
    var geometry: GeometryProxy
    
    init(completedCount: Int, geometry: GeometryProxy) {
            self.completedCount = completedCount
            self.geometry = geometry
        }
    
    var body: some View {
        GeometryReader { geometry in
            if completedCount >= 16 && completedCount <= 30 {
                Image("podoal16+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 31 && completedCount <= 45 {
                Image("podoal31+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 46 && completedCount <= 60 {
                Image("podoal46+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 61 {
                Image("podoal61+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else {
                EmptyView()
            }
        }
    }
}
    
    #Preview {
        ContentView().modelContainer(for: Todo.self, inMemory: false)
    }
