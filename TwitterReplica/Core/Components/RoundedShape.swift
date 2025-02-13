//
//  RoundedShape.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import Foundation
import SwiftUICore
import UIKit


struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path  = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
    
}
