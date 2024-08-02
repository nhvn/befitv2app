import SwiftUI

struct PushWorkoutView: View {
    @State private var isDarkMode = false
    @State private var completedExercises: Set<String> = []
    
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
                        
                        Text("Push Workout")
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .padding(.horizontal)
                        
                        // Shoulders Section
                        WorkoutSection(title: "Shoulders", exercises: [
                            "Overhead Press: 3 sets x 8-10 reps",
                            "Lateral Raises: 3 sets x 12-15 reps",
                            "Front Raises: 3 sets x 12-15 reps"
                        ], isDarkMode: isDarkMode, completedExercises: $completedExercises)
                        
                        // Triceps Section
                        WorkoutSection(title: "Triceps", exercises: [
                            "Tricep Pushdowns: 3 sets x 10 reps",
                            "Skull Crushers: 3 sets x 8-10 reps",
                            "Overhead Tricep Ext: 3 sets x 12 reps"
                        ], isDarkMode: isDarkMode, completedExercises: $completedExercises)
                        
                        // Chest Section
                        WorkoutSection(title: "Chest", exercises: [
                            "Bench Press: 3 sets x 8-10 reps",
                            "Incl. Dumbbell Press: 3 sets x 10 reps",
                            "Cable Flyes: 3 sets x 12-15 reps"
                        ], isDarkMode: isDarkMode, completedExercises: $completedExercises)
                        
                        Spacer(minLength: 80) // Space for the button
                    }
                    .padding(.vertical)
                }
                .background(isDarkMode ? Color.black : Color.white)
                .foregroundColor(isDarkMode ? .white : .black)
                
                // Bottom button
                VStack {
                    Spacer()
                    Button(action: {
                        // Action to see other workouts
                    }) {
                        Text("View Other Workouts")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Push Workout")
            .navigationBarHidden(true)
        }
    }
}

struct WorkoutSection: View {
    let title: String
    let exercises: [String]
    let isDarkMode: Bool
    @Binding var completedExercises: Set<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            ForEach(exercises, id: \.self) { exercise in
                HStack {
                    Text("• \(exercise)")
                        .font(.body)
                    Spacer()
                    Button(action: {
                        toggleExercise(exercise)
                    }) {
                        Image(systemName: completedExercises.contains(exercise) ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(completedExercises.contains(exercise) ? .green : .gray)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    private func toggleExercise(_ exercise: String) {
        if completedExercises.contains(exercise) {
            completedExercises.remove(exercise)
        } else {
            completedExercises.insert(exercise)
        }
    }
}

struct PushWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        PushWorkoutView()
    }
}
