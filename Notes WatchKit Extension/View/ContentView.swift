//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
  
  func save() { // Encodes the data
    dump(notes) // is like a print statement
    do {
      // 1. Convert the notes array to data using JSONEncoder
      let data = try JSONEncoder().encode(notes)
      
      // 2. Create a new URL to save the file using getDocumentDirectory (func below)
      let url = getDocumentDirectory().appendingPathComponent("notes")
      
      // 3. Write the data to the given URL
      try data.write(to: url)
    } catch {
      print("Saving data failed")
    }
  }
  
  func load() { // Decodes the data
    do {
      // 1. Get the notes url path
      let url = getDocumentDirectory().appendingPathComponent("notes")
      
      // 2. Create a new property for the data
      let data = try Data(contentsOf: url)
      
      // 3. Decode the data
      notes = try JSONDecoder().decode([Note].self, from: data)
    } catch {
      // Do nothing as if no data then we don't need to do anything
    }
  }
  
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 6) {
        TextField("Add New Note", text: $text)
        
        Button(action: {
          // 1. only run the buttons action when the textfield is not empty
          guard text.isEmpty == false else { return } // if note is empty the rest of the closure will not run
          
          // 2. create a new note item and initialize it with the text value
          let note = Note(id: UUID(), text: text)
          
          // 3. add the new note item to the notes array
          notes.append(note)
          
          // 4. make the text field empty
          text = ""
          
          // 5. save the notes
          save()
        }, label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 42, weight: .semibold))
        })
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
      } // hstack
      
      Spacer()
      
      Text("\(notes.count)")
    } // vstack
    
    .navigationTitle("Notes")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
