//
//  ShapeAttributes.swift
//  ShapeSearch
//
//  Created by Lou Franco on 8/24/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//

import Foundation

public enum ShapeAttribute: Int {
    case IsSolid
    case IsPatterned
    case IsRectangle
    case HasBorder
    case HasStraightSides
    case HasCurvedSides
    case HasLinedPattern
    case HasGridPattern
    case HasDotPattern
    case HasHole

    case IsBlue
    case IsRed
    case IsGreen
    case IsYellow
    case IsOrange
    case IsPurple
    case IsGray
    case IsBlack

    public func question() -> String {
        switch (self) {
        case .IsSolid:
            return "Is it filled with a solid color"
        case .IsPatterned:
            return "Is it filled with a pattern"
        case .IsRectangle:
            return "Does it have four sides"
        case .HasBorder:
            return "Does it have a border"
        case .HasStraightSides:
            return "Does it have straight sides"
        case .HasCurvedSides:
            return "Does it have curved sides"
        case .HasLinedPattern:
            return "Is it filled with a lined pattern"
        case .HasGridPattern:
            return "Is it filled with a grid pattern"
        case .HasDotPattern:
            return "Is it filled with a dot pattern"
        case .HasHole:
            return "Does it have a hole"
        case .IsBlue:
            return "Is it blue"
        case .IsRed:
            return "Is it red"
        case .IsGreen:
            return "Is it green"
        case .IsYellow:
            return "Is it yellow"
        case .IsOrange:
            return "Is it orange"
        case .IsPurple:
            return "Is it purple"
        case .IsGray:
            return "Is it gray"
        case .IsBlack:
            return "Is it black"
        }
    }

    public func answer(isYes: Bool) -> String {
        let isAnswer = isYes ? "Yes, it is" : "No, it is not"
        let hasAnswer = isYes ? "Yes, it has" : "No, it does not have"

        switch (self) {
        case .IsSolid:
            return "\(isAnswer) filled with a solid color"
        case .IsPatterned:
            return "\(isAnswer) filled with a pattern"
        case .IsRectangle:
            return "\(hasAnswer) four sides"
        case .HasBorder:
            return "\(hasAnswer) a border"
        case .HasStraightSides:
            return "\(hasAnswer) straight sides"
        case .HasCurvedSides:
            return "\(hasAnswer) curved sides"
        case .HasLinedPattern:
            return "\(isAnswer) filled with a lined pattern"
        case .HasGridPattern:
            return "\(isAnswer) filled with a grid pattern"
        case .HasDotPattern:
            return "\(isAnswer) filled with a dot pattern"
        case .HasHole:
            return "\(hasAnswer) a hole"
        case .IsBlue:
            return "\(isAnswer) blue"
        case .IsRed:
            return "\(isAnswer) red"
        case .IsGreen:
            return "\(isAnswer) green"
        case .IsYellow:
            return "\(isAnswer) yellow"
        case .IsOrange:
            return "\(isAnswer) orange"
        case .IsPurple:
            return "\(isAnswer) purple"
        case .IsGray:
            return "\(isAnswer) gray"
        case .IsBlack:
            return "\(isAnswer) black"
        }
    }

}
