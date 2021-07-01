//
//  ContentView.swift
//  Project_11_Bookworm_SwiftUI_App_Delegate
//
//  Created by Baris Karalar on 1.07.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(entity: Student.entity(), sortDescriptors: [])
    var students: FetchedResults<Student>
    

    var body: some View {
        
        VStack {
            List {
                ForEach(students) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let randomFirstName = firstNames.randomElement() ?? "Default first name"
                let randomLastName = lastNames.randomElement() ?? "Default last name"
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(randomFirstName) \(randomLastName)"
                
                try? moc.save()
                
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
