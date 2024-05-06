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
                VStack(spacing: 15) {
                    Spacer()
                    ZStack {
                        AchievementRectangle()
                        Text("지금까지 해낸 일")
                    }
                    ZStack {
                        AchievementRectangle()
                        VStack {
                            Spacer()
                            Text("2024. 04. 27")
                                .foregroundColor(Color(hex: "#7b7980"))
                                .padding(.leading, 20)
                                .padding(.bottom, -15)
                            HStack{
                                Image("podoal16+")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 80.0, alignment: .leading)
                                    .padding(.bottom, 20)
                                Spacer()
                                    .frame(width: 40)
                                VStack {
                                    Text("루틴")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("3")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("투 두")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("8")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("달성률")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 5)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("56%")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                    
                    //
                    
                    ZStack {
                        AchievementRectangle()
                        VStack {
                            Spacer()
                            Text("2024. 04. 27")
                                .foregroundColor(Color(hex: "#7b7980"))
                                .padding(.leading, 20)
                                .padding(.bottom, -15)
                            HStack{
                                Image("podoal61+")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 60.0, alignment: .leading)
                                    .padding(.bottom, 20)
                                Spacer()
                                    .frame(width: 40)
                                VStack {
                                    Text("루틴")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("3")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("투 두")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("8")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("달성률")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 5)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("56%")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                    ZStack {
                        AchievementRectangle()
                        VStack {
                            Spacer()
                            Text("2024. 04. 27")
                                .foregroundColor(Color(hex: "#7b7980"))
                                .padding(.leading, 20)
                                .padding(.bottom, -15)
                            HStack{
                                Image("podoal31+")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 70.0, alignment: .leading)
                                    .padding(.bottom, 20)
                                Spacer()
                                    .frame(width: 40)
                                VStack {
                                    Text("루틴")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("3")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("투 두")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("8")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("달성률")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 5)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("56%")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                    ZStack {
                        AchievementRectangle()
                        VStack {
                            Spacer()
                            Text("2024. 04. 27")
                                .foregroundColor(Color(hex: "#7b7980"))
                                .padding(.leading, 20)
                                .padding(.bottom, -15)
                            HStack{
                                Image("podoal16+")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 80.0, alignment: .leading)
                                    .padding(.bottom, 20)
                                Spacer()
                                    .frame(width: 40)
                                VStack {
                                    Text("루틴")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("3")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("투 두")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 20)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("8")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 20)
                                }
                                VStack {
                                    Text("달성률")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 5)
                                    Spacer()
                                        .frame(height: 3)
                                    Text("56%")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
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
