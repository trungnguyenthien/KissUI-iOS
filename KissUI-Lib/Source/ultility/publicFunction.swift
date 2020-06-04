//
//  publicFunction.swift
//  KissUI
//
//  Created by Trung on 6/3/20.
//  Copyright © 2020 trungnguyenthien. All rights reserved.
//

import Foundation
import UIKit

public func frame(of layout: SetViewLayout) -> CGRect {
    guard let width = layout.expectedWidth,
        let height = layout.expectedHeight,
        let x = layout.expectedX,
        let y = layout.expectedY
    else { return .zero }
    return CGRect(x: x, y: y, width: width, height: height)
}

public func size(of layout: SetViewLayout) -> CGSize {
    return frame(of: layout).size
}

public func vstack(_ items: LayoutAttribute...) -> VStackLayout {
    let stack = VStackLayout()
    stack.subLayouts.append(contentsOf: items)
    return stack
}

public func hstack(_ items: LayoutAttribute...) -> HStackLayout {
    let stack = HStackLayout()
    stack.subLayouts.append(contentsOf: items)
    return stack
}

public func wrap(_ items: LayoutAttribute...) -> WrapLayout {
    let wrap = WrapLayout()
    wrap.subLayouts.append(contentsOf: items)
    return wrap
}

public var vspacer: VSpacer {
    return VSpacer()
}

public var hspacer: HSpacer {
    return HSpacer();
}