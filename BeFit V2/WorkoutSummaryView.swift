import SwiftUI
import Charts

struct DashboardView: View {
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
    
    let socialPosts = [
        SocialPost(username: "Donald", workout: "Dodgeball", timeAgo: "2 hours ago", userImage: "donald"),
        SocialPost(username: "James", workout: "1 min run", timeAgo: "4 hours ago", userImage: "james"),
        SocialPost(username: "Andy", workout: "Strength", timeAgo: "Yesterday", userImage: "andy"),
        SocialPost(username: "Anna", workout: "Pickleball", timeAgo: "2 days ago", userImage: "anna"),
        SocialPost(username: "Ash", workout: "Swim", timeAgo: "199 days ago", userImage: "ash")
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
                    
                    Text("Dashboard")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .padding(.horizontal)
                    
                    // Start Workout Button
                    Button(action: {
                        // Action for starting workout
                    }) {
                        Text("Start Workout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    // Dashboard boxes
                    HStack(spacing: 15) {
                        DashboardBox(title: "Weight", value: "158.5 lbs", icon: "scalemass.fill", isDarkMode: isDarkMode)
                        DashboardBox(title: "Diet", value: "1800 kcal", icon: "fork.knife", isDarkMode: isDarkMode)
                        DashboardBox(title: "Workout", value: "30 min", icon: "figure.walk", isDarkMode: isDarkMode)
                    }
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
                    
                    // Social Box
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Social Feed")
                            .font(.headline)
                            .padding(.bottom, 5)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                        
                        ForEach(socialPosts) { post in
                            HStack {
                                Image(post.userImage)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 40, height: 40)
                                
                                VStack(alignment: .leading) {
                                    Text(post.username)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                                    
                                    HStack {
                                        Text(post.workout)
                                            .font(.subheadline)
                                            .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
                                        Text(post.timeAgo)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .padding(.leading, 5) // Small margin to the right
                                    }
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    // Action for chat button
                                }) {
                                    Image(systemName: "message.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.gray)
                                        .padding(5)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
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
            .navigationTitle("BeFit Dashboard")
            .navigationBarHidden(true)
        }
    }
}

struct DashboardBox: View {
    let title: String
    let value: String
    let icon: String
    let isDarkMode: Bool
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 30))
                .padding(.bottom, 5)
            Text(title)
                .font(.headline)
                .foregroundColor(isDarkMode ? .white : .black) // Adjust text color
            Text(value)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .padding()
        .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}

struct SocialPost: Identifiable {
    let id = UUID()
    let username: String
    let workout: String
    let timeAgo: String
    let userImage: String
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
