//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Nic Deane on 27/9/21.
//

import SwiftUI

struct CreditsView: View {
  
  @State private var randomNo: Int = Int.random(in: 1..<4)
  private var randomImage: String {
    return "developer-no\(randomNo)"
  }
  
  var body: some View {
    VStack(spacing: 3) {
      Image(randomImage)
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      HeaderView(title: "Credits")
      Text("Nic Deane")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      Text("Developer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    }
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
