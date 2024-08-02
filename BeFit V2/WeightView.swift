import SwiftUI
import Charts

struct WeightView: View {
    @State private var isDarkMode = false
    
    let weightData: [(date: Date, weight: Double)] = [
        (date: Date.now.addingTimeInterval(-6 * 86400), weight: 159.8),
        (date: Date.now.addingTimeInterval(-5 * 86400), weight: 160.2),
        (date: Date.now.addingTimeInterval(-4 * 86400), weight: 159.5),
        (date: Date.now.addingTimeInterval(-3 * 86400), weight: 159.1),
        (date: Date.now.addingTimeInterval(-2 * 86400), weight: 159.7),
        (date: Date.now.addingTimeInterval(-1 * 86400), weight: 158.9),
        (date: Date.now, weight: 158.5)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Top bar
                    HStack {
                        Image(isDarkMode ? "beFit-dark" : "beFit-light")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        
                        Spacer()
                        
                        Button(action: {
                            isDarkMode.toggle()
                        }) {
                            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                                .foregroundColor(isDarkMode ? .white : .black)
                        }
                        .padding(.trailing, 10)
                        
                        Text("Hi, Alan")
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    .padding(.horizontal)
                    
                    Text("Weight Tracker")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .padding(.horizontal)
                    
                    // Weight Trend Chart
                    VStack(alignment: .leading) {
                        Text("Weight Trend")
                            .font(.headline)
                            .padding(.bottom, 5)
                            .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                        
                        Chart {
                            ForEach(weightData, id: \.date) { item in
                                LineMark(
                                    x: .value("Date", item.date),
                                    y: .value("Weight", item.weight)
                                )
                                .foregroundStyle(isDarkMode ? Color.white : Color.black) // Line color
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: 158...161)
                        .foregroundColor(isDarkMode ? .white : .black) // Adjust axis and grid color
                    }
                    .padding()
                    .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Today's Weight
                    VStack(alignment: .leading) {
                        Text("Today's Weight")
                            .font(.headline)
                            .padding(.bottom, 5)
                            .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                        
                        Button(action: {
                            // Action for adding weight
                        }) {
                            Text("Add Weight")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Previous Entries
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Previous Entries")
                            .font(.headline)
                            .padding(.bottom, 5)
                            .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                        
                        ForEach(weightData.reversed(), id: \.date) { item in
                            HStack {
                                Text(item.date, style: .date)
                                    .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                                Spacer()
                                Text("\(item.weight, specifier: "%.1f") lbs")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding()
                    .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 50)
                }
                .padding(.vertical)
            }
            .background(isDarkMode ? Color.black : Color.white)
            .foregroundColor(isDarkMode ? .white : .black)
            .navigationTitle("Weight Tracker")
            .navigationBarHidden(true)
        }
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
