import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            DateDifferenceView()
                .tabItem {
                    Label("날짜 차이", systemImage: "calendar")
                }
                .tag(0)
            
            DateAfterView()
                .tabItem {
                    Label("날짜 계산", systemImage: "arrow.right.circle")
                }
                .tag(1)
        }
        .environment(\.locale, Locale(identifier: "ko_KR"))
    }
}

struct DateDifferenceView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var daysBetween: Int {
        DateCalculator.daysBetween(start: startDate, end: endDate)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("날짜 선택")) {
                    DatePicker("시작 날짜", selection: $startDate, displayedComponents: .date)
                    DatePicker("종료 날짜", selection: $endDate, displayedComponents: .date)
                }
                
                Section(header: Text("결과")) {
                    HStack {
                        Text("차이 (일):")
                        Spacer()
                        Text("\(daysBetween)")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("날짜 차이 계산기")
        }
    }
}

struct DateAfterView: View {
    @State private var startDate = Date()
    @State private var daysToAddString = ""
    
    var resultDate: Date {
        let days = Int(daysToAddString) ?? 0
        return DateCalculator.dateAfter(days: days, from: startDate)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("시작 날짜")) {
                    DatePicker("날짜", selection: $startDate, displayedComponents: .date)
                }
                
                Section(header: Text("더할 일 수")) {
                    TextField("일 수를 입력하세요 (예: 100, -5)", text: $daysToAddString)
                        .keyboardType(.numbersAndPunctuation)
                }
                
                Section(header: Text("결과 날짜")) {
                    HStack {
                        Text("날짜:")
                        Spacer()
                        Text(resultDate, style: .date)
                            .bold()
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("미래/과거 날짜 계산기")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
