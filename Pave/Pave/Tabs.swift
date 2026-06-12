//
//  Tabs.swift
//  Pave
//
//  Created by Cuong Nguyen on 10/6/26.
//

import HotwireNative
import UIKit

// All native tab bar entries. Each tab loads a Rails URL in its own navigator.
// Add/remove a tab by editing this one file — the screen itself lives in Rails.
private let todayTab = HotwireTab(
    title: "Today",
    image: UIImage(systemName: "calendar")!,
    url: baseURL.appending(path: "today")
)
private let projectsTab = HotwireTab(
    title: "Projects",
    image: UIImage(systemName: "folder")!,
    url: baseURL.appending(path: "projects")
)
private let inboxTab = HotwireTab(
    title: "Inbox",
    image: UIImage(systemName: "tray")!,
    url: baseURL.appending(path: "inbox")
)
private let guideTab = HotwireTab(
    title: "Guide",
    image: UIImage(systemName: "book")!,
    url: baseURL.appending(path: "guide")
)
private let supportTab = HotwireTab(
    title: "Support",
    image: UIImage(systemName: "questionmark.circle")!,
    url: baseURL.appending(path: "support")
)

extension HotwireTab {
    static let all = [todayTab, projectsTab, inboxTab, guideTab, supportTab]
}
