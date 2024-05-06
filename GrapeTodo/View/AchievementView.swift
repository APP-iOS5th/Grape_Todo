import SwiftUI

struct AchievementView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ZStack(alignment: .leading) {
                        AchievementRectangle()
                        
                        HStack{
                            VStack(alignment: .leading){
                                HStack {
                                    Text("지금까지 해낸 일")
                                        .font(.system(size: 15))
                                        .padding(.leading, 15)
                                        .padding(.top, 50)
                                    Text("하루 평균")
                                        .font(.system(size: 15))
                                        .padding(.leading, 47)
                                        .padding(.top, 40)
                                        .padding(.bottom, -10)
                                }
                                HStack{
                                    Text("284")
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                        .padding(.bottom, 20)
                                    Text("개")
                                        .font(.system(size: 20))
                                        .padding(.bottom, 10)
                                    
                                    Spacer()
                                    VStack {
                                        Text("루틴")
                                            .font(.system(size: 15))
                                            .padding(.trailing, 20)
                                            .foregroundStyle(Color(hex: "#4C4C4C"))

                                            .frame(height: 3)
                                        Text("3")
                                            .font(.title)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.trailing, 20)
                                            .padding(.bottom, 20)
                                    }
                                    VStack {
                                        Text("투 두")
                                            .font(.system(size: 15))
                                            .padding(.trailing, 20)
                                            .foregroundStyle(Color(hex: "#4C4C4C"))

                                            .frame(height: 3)
                                        Text("8")
                                            .font(.title)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.trailing, 20)
                                            .padding(.bottom, 20)
                                    }
                                    VStack {
                                        Text("달성률")
                                            .font(.system(size: 15))
                                            .padding(.trailing, 5)
                                            .foregroundStyle(Color(hex: "#4C4C4C"))

                                            .frame(height: 3)
                                        Text("56%")
                                            .font(.title)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.bottom, 20)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    AchievementItem(date: "2024. 04. 27", imageName: "podoal16+", routineCount: 3, todoCount: 8, completionRate: "56%")
                    AchievementItem(date: "2024. 04. 26", imageName: "podoal61+", routineCount: 21, todoCount: 42, completionRate: "98%")
                    AchievementItem(date: "2024. 04. 24", imageName: "podoal31+", routineCount: 5, todoCount: 12, completionRate: "72%")
                    AchievementItem(date: "2024. 04. 22", imageName: "podoal16+", routineCount: 7, todoCount: 18, completionRate: "43%")
                }
                .navigationTitle("Achievement")
            }
            .padding()
            .background(Color(hex: "#F2F2F7"))
        }
    }
}

struct AchievementItem: View {
    let date: String
    let imageName: String
    let routineCount: Int
    let todoCount: Int
    let completionRate: String
    
    var body: some View {
        ZStack {
            AchievementRectangle()
            VStack {
                Spacer()
                Text(date)
                    .foregroundColor(Color(hex: "#7b7980"))
                    .padding(.leading, 20)
                    .padding(.bottom, -15)
                HStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85.0, height: 80.0, alignment: .center)
                        .padding(.bottom, 20)
                    Spacer()
                        .frame(width: 40)
                    StatisticView(title: "루틴", count: routineCount)
                    StatisticView(title: "투 두", count: todoCount)
                    StatisticView(title: "달성률", count: completionRate)
                }
            }
        }
    }
}

struct StatisticView: View {
    let title: String
    let count: Any
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 17))
                .padding(.trailing, 20)
            Spacer()
                .frame(height: 3)
            Text("\(count)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.trailing, 20)
        }
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

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}


