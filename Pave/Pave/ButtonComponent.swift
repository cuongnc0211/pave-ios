//
//  ButtonComponent.swift
//  Pave
//
//  Created by Cuong Nguyen on 10/6/26.
//

import HotwireNative
import UIKit

// Native nav-bar button declared by a `bridge--button` element in the HTML.
// On tap, replies to JS → JS clicks the underlying link → Turbo navigates.
final class ButtonComponent: BridgeComponent {
    override nonisolated class var name: String { "button" }

    private var viewController: UIViewController? {
        delegate?.destination as? UIViewController
    }

    override func onReceive(message: Message) {
        guard message.event == "connect", let viewController else { return }
        addButton(from: message, to: viewController)
    }

    private func addButton(from message: Message, to viewController: UIViewController) {
        let data = decode(message.jsonData)
        let action = UIAction { [weak self] _ in self?.reply(to: "connect") }

        let item: UIBarButtonItem
        if let symbol = data?.symbol, let image = UIImage(systemName: symbol) {
            item = UIBarButtonItem(image: image, primaryAction: action)
        } else {
            item = UIBarButtonItem(title: data?.title ?? "Menu", primaryAction: action)
        }

        viewController.navigationItem.rightBarButtonItems = [item]
    }

    private func decode(_ jsonData: String) -> ButtonData? {
        guard let raw = jsonData.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(ButtonData.self, from: raw)
    }
}

private struct ButtonData: Decodable {
    let symbol: String?
    let title: String?
}

