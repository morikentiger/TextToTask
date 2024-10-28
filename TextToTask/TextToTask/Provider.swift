//
//  Provider.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//


import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        completion(SimpleEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry()], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date = Date()
}