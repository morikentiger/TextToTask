//
//  SceneDelegate.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//


//import SwiftUI
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    var window: UIWindow?
//    @StateObject var taskManager = TaskManager()
//
//    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//        guard let url = URLContexts.first?.url else { return }
//        if url.absoluteString == "myappscheme://add" {
//            if let rootView = window?.rootViewController as? UIHostingController<ContentView> {
//                rootView.rootView = ContentView().environmentObject(taskManager) as! ContentView
//                DispatchQueue.main.async {
//                    rootView.rootView.taskManager = self.taskManager
//                    rootView.present(UIHostingController(rootView: AddTaskView(taskManager: self.taskManager)), animated: true, completion: nil)
//                }
//            }
//        }
//    }
//}
