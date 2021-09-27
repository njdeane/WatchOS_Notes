//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct SettingsView: View {
  
  @AppStorage("lineCount") var lineCount: Int = 1 //AppStorage is user defaults. When line count changes the user defaults is auto updated.
  @State private var value: Float = 1.0
  
  func update() {
    lineCount = Int(value)
  }
  
  var body: some View {
    VStack(spacing: 8) {
      HeaderView(title: "Settings")
      
      Text("Lines: \(lineCount)".uppercased())
        .fontWeight(.bold)
      
      Slider(value: Binding(get: { // CUSTOM BINDING
        self.value
      }, set: {(newValue) in
        self.value = newValue
        self.update()
      }), in: 1...4, step: 1)
        .accentColor(.accentColor)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
