//
//  Prefecture+.swift
//  SampleKMM-iOS
//
//  Created by Taniuchi Wataru on 2023/04/26.
//

import Foundation
import shared

extension Prefecture {
    static func convert(tag: Int) -> Prefecture {
        switch tag {
        case 1: return Prefecture.tokyo
        case 2: return Prefecture.chiba
        case 3: return Prefecture.kanagawa
        default: return Prefecture.tokyo
        }
    }
}
