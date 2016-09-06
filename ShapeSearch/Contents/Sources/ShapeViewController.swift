//
//  ShapeViewController.swift
//  PGBookHost
//
//  Created by Lou Franco on 9/1/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//
//  The View Controller shown in the LiveView of the Playground Book with 16 shapes on it.

import Foundation
import UIKit
import GameKit
import PlaygroundSupport

public class ShapeViewController: UIViewController {

    var shuffledShapes = shuffleShapes(shapes: Shapes)
    var chosenShape: Int = 0
    var imageViews = [UIImageView]()

    public override func viewDidLoad() {
        self.view.backgroundColor = .white

        var rows = [UIStackView]()
        for i in 0..<4 {
            var views = [UIView]()
            for j in 0..<4 {
                let index = i*4 + j
                let imageView = UIImageView(image: self.shuffledShapes[index].image())
                imageView.translatesAutoresizingMaskIntoConstraints = false
                // DEBUG
                //if index == chosenShape {
                //    imageView.backgroundColor = .blue
                //}
                imageViews.append(imageView)
                views.append(imageView)
            }
            rows.append(makeStackView(arrangedSubviews: views, axis: .horizontal))
        }

        let col = makeStackView(arrangedSubviews: rows, axis: .vertical)
        self.view.addSubview(col)
        setConstraintsToFillView(forSubview: col)
        reset()
    }

    public func setConstraintsToFillView(forSubview subview: UIView) {
        let margins = self.view.layoutMarginsGuide
        subview.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    public func makeStackView(arrangedSubviews: [UIView], axis: UILayoutConstraintAxis) -> UIStackView {
        let sv = UIStackView(arrangedSubviews: arrangedSubviews)
        sv.axis = axis
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .equalSpacing
        return sv
    }

    func showMessage(message: String, buttonText: String, completion: (() -> ())? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonText, style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
            completion?()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    func reset() {
        self.imageViews.forEach { imgView in
            imgView.alpha = 1.0
        }
        //-REMOVEchosenShape = GKRandomSource.sharedRandom().nextInt(withUpperBound: shuffledShapes.count)
        chosenShape = GKRandomSource.sharedRandom().nextInt(upperBound: shuffledShapes.count) // REMOVE LINE
    }

    func checkIfDone() {
        let countOn = self.imageViews.reduce(0) { $0 + ($1.alpha == 1.0 ? 1 : 0) }
        if countOn == 1 {
            showMessage(message: "You found the shape", buttonText: "Reset") { [weak self] in self?.reset() }
        }
    }

    func ask(attribute: ShapeAttribute) {
        let shape = self.shuffledShapes[self.chosenShape]
        let answerIsYes = shape.attributes.contains(attribute)
        showMessage(message: attribute.answer(isYes: answerIsYes), buttonText: "OK") { [weak self] in self?.checkIfDone() }
        if answerIsYes {
            dimShapes(ifAttribute: attribute, isPresent: false)
        } else {
            dimShapes(ifAttribute: attribute, isPresent: true)
        }
    }

    func setShapeOrder(shapeOrder: [Int]) {
        self.shuffledShapes = shapeOrder.map { Shapes[$0] }
        for i in 0..<self.shuffledShapes.count {
            self.imageViews[i].image = self.shuffledShapes[i].image()
        }
    }

    func eliminateShape(atIndex index: Int) {
        self.imageViews[index].alpha = 0.1
    }

    func dimShapes(ifAttribute attribute: ShapeAttribute, isPresent: Bool) {
        for i in 0..<self.shuffledShapes.count {
            if self.shuffledShapes[i].attributes.contains(attribute) == isPresent {
                self.imageViews[i].alpha = 0.1
            }
        }
    }
}

extension ShapeViewController: PlaygroundLiveViewMessageHandler {

    public func liveViewMessageConnectionOpened() {
    }

    public func liveViewMessageConnectionClosed() {
    }

    public func receive(_ message: PlaygroundValue) {
        guard let method = message.stringFromDict(withKey: "method") else { return }
        switch (method) {
        case "ask":
            guard let attributeRaw = message.integerFromDict(withKey: "attribute"),
                  let attribute = ShapeAttribute(rawValue: attributeRaw)
            else {
                return
            }
            ask(attribute: attribute)

        case "setShapeOrder":
            guard let shapeOrder = message.arrayFromDict(withKey: "shapeOrder")?.map({ v -> Int in
                if case let .integer(i) = v {
                    return i
                }
                return 0
            })
            else {
                return
            }
            setShapeOrder(shapeOrder: shapeOrder)

        case "eliminateShape":
            guard let atIndex = message.integerFromDict(withKey: "atIndex") else { return }
            eliminateShape(atIndex: atIndex)

        default:
            break
        }
    }
}
