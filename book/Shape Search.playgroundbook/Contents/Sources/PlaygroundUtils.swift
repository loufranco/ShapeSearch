//
//  PlaygroundUtils.swift
//  PGBookHost
//
//  Created by Lou Franco on 9/3/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//

import Foundation
import PlaygroundSupport

extension PlaygroundValue {
    func stringFromDict(withKey key: String) -> String? {
        if case .dictionary(let dict) = self,
            let value = dict[key],
            case .string(let str) = value {
            return str
        }
        return nil
    }

    func integerFromDict(withKey key: String) -> Int? {
        if case .dictionary(let dict) = self,
            let value = dict[key],
            case .integer(let num) = value {
            return num
        }
        return nil
    }

    func arrayFromDict(withKey key: String) -> [PlaygroundValue]? {
        if case .dictionary(let dict) = self,
            let value = dict[key],
            case .array(let array) = value {
            return array
        }
        return nil
    }
}
