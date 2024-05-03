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
                    ZStack {
                        AchievementRectangle()
                        Text("지금까지 해낸 일")
                    }
                    ZStack {
                        AchievementRectangle()
                        HStack{
                            Image("podoal16+")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80.0, alignment: .leading)
                            VStack {
                                Text("루틴")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .padding(5)
                                Text("3")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            VStack {
                                Text("투 두")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .padding(5)
                                Text("8")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            VStack {
                                Text("달성률")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .padding(5)
                                Text("56%")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                        }
                    }
                }
                .navigationTitle("Achivement")
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