//
//  AchievementView.swift
//  GrapeTodo
//
//  Created by Mac on 5/2/24.
//

import SwiftUI

struct AchievementView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                    ForEach(0..<5) { index in
                        ZStack {
                            AchievementRectangle()
                            Text("Achievement \(index + 1)")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding()
                        }
                    }
                }
                .navigationTitle("Achievement")
            }
            .background(Color(hex: "#F2F2F7"))
        }
        .padding()
        .background(Color(hex: "#F2F2F7"))
        
    }
}

struct AchievementRectangle: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(width: .infinity, height: 130)
            .cornerRadius(15)
    }
}



#Preview {
    AchievementView()
}
