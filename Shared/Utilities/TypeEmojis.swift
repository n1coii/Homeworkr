//
//  TypeEmojis.swift
//  Homeworkr
//
//  Created by Nicolas Legros on 2021-02-22.
//

import Foundation

func getTypeEmoji(_ taskType: String) -> String {
    let emojiDict = [ "exam": "‼️",
                      "homework": "📚",
                      "project": "📓",
                      "lab": "🔬"]


    return emojiDict[taskType.lowercased()] ?? "☕️"
}
