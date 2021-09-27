//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Nic Deane on 27/9/21.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}
