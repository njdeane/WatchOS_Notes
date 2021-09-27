//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct DetailView: View {
  
  let note: Note
  let count: Int
  let index: Int
  
  var body: some View {
    VStack(alignment: .center, spacing: 3)  {
      // Header
      HStack {
        Capsule()
          .frame(height: 1)
          
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      }
      .foregroundColor(.accentColor)
      
      // Content
      Spacer()
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      
      Spacer()
      
      // Footer
      HStack(alignment: .center) {
        Image(systemName: "gear")
          .imageScale(.large)
        
        Spacer()
        
        Text("\(index + 1) / \(count) ")
        
        Spacer()
        
        Image(systemName: "info.circle")
          .imageScale(.large)
      }
      .foregroundColor(.secondary)
    }
    .padding(3)
  }
}

struct DetailView_Previews: PreviewProvider {
  
  static var sampleData: Note = Note(id: UUID(), text: "Hello Pirates!")
  
  static var previews: some View {
    DetailView(note: sampleData, count: 5, index: 1)
  }
}
