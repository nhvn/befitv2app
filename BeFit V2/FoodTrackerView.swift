import SwiftUI

struct DietView: View {
    @State private var isDarkMode = false
    
    // Sample data
    let caloriesConsumed = 1500
    let caloriesGoal = 2000
    let carbsConsumed = 150
    let carbsGoal = 250
    let proteinConsumed = 100
    let proteinGoal = 150
    let fatConsumed = 50
    let fatGoal = 70
    
    // Sample food entries
    let foodEntries = [
        FoodEntry(name: "Oatmeal with Berries", calories: 300, carbs: 45, protein: 10, fat: 6),
        FoodEntry(name: "Grilled Chicken Salad", calories: 450, carbs: 15, protein: 40, fat: 20),
        FoodEntry(name: "Greek Yogurt", calories: 150, carbs: 10, protein: 20, fat: 4),
        FoodEntry(name: "Almonds", calories: 160, carbs: 6, protein: 6, fat: 14),
        FoodEntry(name: "Banana", calories: 105, carbs: 27, protein: 1, fat: 0)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
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
                    
                    Text("Diet Overview")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    // Nutrition Overview Box
                    HStack(spacing: 20) {
                        // Calories Circle
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 20.0)
                                .opacity(0.3)
                                .foregroundColor(Color.blue)
                            
                            Circle()
                                .trim(from: 0.0, to: CGFloat(caloriesConsumed) / CGFloat(caloriesGoal))
                                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.blue)
                                .rotationEffect(Angle(degrees: 270.0))
                            
                            VStack {
                                Text("\(caloriesConsumed)")
                                    .font(.title)
                                    .bold()
                                Text("/ \(caloriesGoal)")
                                    .font(.subheadline)
                                Text("kcal")
                                    .font(.caption)
                            }
                        }
                        .frame(width: 150, height: 150)
                        
                        // Macronutrients Bars
                        VStack(spacing: 15) {
                            NutrientBar(nutrient: "Carbs", consumed: carbsConsumed, goal: carbsGoal, color: .green)
                            NutrientBar(nutrient: "Protein", consumed: proteinConsumed, goal: proteinGoal, color: .red)
                            NutrientBar(nutrient: "Fat", consumed: fatConsumed, goal: fatGoal, color: .yellow)
                        }
                    }
                    .padding()
                    .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    // Add Food Button
                    Button(action: {
                        // Action to add food
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Food")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    // Food Entries
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Today's Food")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        ForEach(foodEntries) { entry in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(entry.name)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text("\(entry.calories) kcal | C: \(entry.carbs)g | P: \(entry.protein)g | F: \(entry.fat)g")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding()
                    .background(isDarkMode ? Color(white: 0.2) : Color(UIColor.systemGray6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 50)
                }
                .padding(.vertical)
            }
            .background(isDarkMode ? Color.black : Color.white)
            .foregroundColor(isDarkMode ? .white : .black)
            .navigationTitle("Diet")
            .navigationBarHidden(true)
        }
    }
}

struct NutrientBar: View {
    let nutrient: String
    let consumed: Int
    let goal: Int
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(nutrient)
                .font(.caption)
            HStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(color.opacity(0.3))
                    Rectangle()
                        .fill(color)
                        .frame(width: CGFloat(consumed) / CGFloat(goal) * UIScreen.main.bounds.width * 0.5)
                }
                .frame(height: 10)
                .cornerRadius(5)
            }
            Text("\(consumed)g / \(goal)g")
                .font(.caption2)
        }
    }
}

struct FoodEntry: Identifiable {
    let id = UUID()
    let name: String
    let calories: Int
    let carbs: Int
    let protein: Int
    let fat: Int
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
