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
  
  func save() {
    dump(notes) // is like a print statement?
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
