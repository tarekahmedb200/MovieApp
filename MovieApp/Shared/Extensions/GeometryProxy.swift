//
//  GeometryProxy.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation
import SwiftUI

extension GeometryProxy {
    private var offset: CGFloat { frame(in: .global).minY }
    var height: CGFloat { size.height + (offset > 0 ? offset : 0) }
    var verticalOffset: CGFloat { offset > 0 ? -offset : 0 }
}
