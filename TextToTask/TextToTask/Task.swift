//
//  Task.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//


import Foundation

struct Task: Identifiable, Codable{
    let id = UUID()
    let title: String
    let dueDate: Date
}
