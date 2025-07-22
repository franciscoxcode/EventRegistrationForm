//
//  ContentView.swift
//  EventRegistrationForm
//
//  Created by Francisco Jean on 22/07/25.
//

import SwiftUI

struct ContentView: View {
    
    let interests = ["Design", "Software", "Marketing"]
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var interest: String = "Design"
    @State private var receiveMail: Bool = false
    @State private var errorMessage: String = ""
    @State private var successMessage: String = ""
    
    var body: some View {
        VStack {
           Text("Event Registration")
                .font(.title)
            Form {
                Section(header: Text("Form")){
                    TextField("Name", text: $name)
                    TextField("Age", text: $age)
                    Picker("Interest", selection: $interest) {
                        ForEach(interests, id: \.self){ interest in Text(interest) 
                        }
                    }
                    Toggle("Receive notifications", isOn: $receiveMail)
                }
            }
            .frame(maxHeight: 250)
            
            Button("Submit") {
                               validate()
                           }
                           .disabled(name.isEmpty || age.isEmpty)
                           .buttonStyle(.bordered)

            
            if !errorMessage.isEmpty {
                               Text(errorMessage)
                                   .foregroundColor(.red)
                                   .font(.subheadline)
            } else {
                Text(successMessage)
                    .foregroundColor(.green)
                    .font(.subheadline)
            }
            
                    }
        .padding()
        Spacer()
    }
    
    func validate() {
        guard !name.isEmpty else {
            errorMessage = "Name is required"
                return
            }
                
        guard let age = Int(age), age > 0 else {
            errorMessage = "Enter a valid age"
                return
            }
                
        // Si todo está bien
            errorMessage = ""
            successMessage = "Information validated!"
            print("✅ Form is valid: \(name), \(age) años")
    }
}

#Preview {
    ContentView()
}
