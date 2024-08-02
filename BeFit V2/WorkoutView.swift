import SwiftUI

struct WorkoutsView: View {
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            ZStack {
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
                        
                        Text("Workouts")
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .padding(.horizontal)
                        
                        // Bro Split Section
                        VStack(alignment: .center, spacing: 15) {
                            Text("Bro Split")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom)
                            
                            VStack(spacing: 15) {
                                WorkoutBox(title: "Push", description: "Shoulders, Triceps, Chest", isDarkMode: isDarkMode)
                                WorkoutBox(title: "Pull", description: "Back, Biceps", isDarkMode: isDarkMode)
                                WorkoutBox(title: "Legs", description: "Legs", isDarkMode: isDarkMode)
                            }
                            .padding(.horizontal)
                        }
                        
                        // Arnold Split Section
                        VStack(alignment: .center, spacing: 15) {
                            Text("Arnold Split")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom)
                            
                            VStack(spacing: 15) {
                                WorkoutBox(title: "Legs", description: "Legs", isDarkMode: isDarkMode)
                                WorkoutBox(title: "Chest & Back", description: "Chest, Back", isDarkMode: isDarkMode)
                                WorkoutBox(title: "Arms", description: "Biceps, Shoulders, Triceps", isDarkMode: isDarkMode)
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.vertical)
                }
                .background(isDarkMode ? Color.black : Color.white)
                .foregroundColor(isDarkMode ? .white : .black)
                .navigationTitle("BeFit Workouts")
                .navigationBarHidden(true)
                
                // Add Workout Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // Action to add workout
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct WorkoutBox: View {
    let title: String
    let description: String
    let isDarkMode: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 50) // Shorter height
        .padding()
        .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
