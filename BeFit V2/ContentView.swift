import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    
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
                        
                        Button(action: {
                            // Login action
                        }) {
                            Text("Login")
                                .foregroundColor(isDarkMode ? .black : .white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(isDarkMode ? Color.white : Color.black)
                                .cornerRadius(5)
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("Unlock Your Best Self: Your Ultimate Progress Tracking Companion!")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    // Buttons Section
                    HStack(spacing: 20) {
                        Button(action: {
                            // Action for Documentation button
                        }) {
                            Text("Documentation")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Action for GitHub button
                        }) {
                            Text("GitHub")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(white: 0.9))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Add the image
                    Image("missionLogin")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    
                    Text("From Doubt to Determination: The BeFit Success Story")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Text("In a world where busy schedules, endless distractions, and self-doubt often derail our fitness ambitions, there emerged a powerful solution – BeFit. This is the story of how one innovative app transformed the lives of countless individuals, empowering them to take control of their fitness journey.")
                        .padding(.horizontal)
                        .foregroundColor(Color(red: 117/255, green: 132/255, blue: 152/255))
                        .font(.system(size: 18, weight: .regular, design: .default))
                    
                    Spacer(minLength: 50)
                }
                .padding(.vertical)
            }
            .background(isDarkMode ? Color.black : Color.white)
            .foregroundColor(isDarkMode ? .white : .black)
            .navigationTitle("BeFit V2 Dashboard")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
