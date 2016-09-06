//
//  ShapeData.swift
//  PGBookHost
//
//  Created by Lou Franco on 9/1/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//
//  Structs and data that represents the data of each shape

import Foundation
import UIKit
import GameKit

public class Shape {
    public let id: Int
    public let resourceName: String
    public let attributes: Set<ShapeAttribute>

    public init(id: Int, resourceName: String, attributes: Set<ShapeAttribute>) {
        self.id = id
        self.resourceName = resourceName
        self.attributes = attributes
    }

    public func image() -> UIImage {
        return #imageLiteral(resourceName: resourceName)
    }
}

public let Shapes = [
    Shape(id:0, resourceName: "shape-01", attributes: Set([.IsBlack, .HasStraightSides, .IsSolid])),
    Shape(id:1, resourceName: "shape-02", attributes: Set([.IsBlack, .HasStraightSides, .IsPatterned, .HasBorder])),
    Shape(id:2, resourceName: "shape-03", attributes: Set([.IsBlue, .HasStraightSides, .IsSolid, .HasBorder, .IsRectangle])),
    Shape(id:3, resourceName: "shape-04", attributes: Set([.IsBlue, .HasStraightSides, .IsPatterned, .HasDotPattern, .HasBorder, .IsRectangle])),
    Shape(id:4, resourceName: "shape-05", attributes: Set([.IsGray, .HasStraightSides, .IsSolid])),
    Shape(id:5, resourceName: "shape-06", attributes: Set([.IsGray, .HasCurvedSides, .IsPatterned, .HasDotPattern, .HasBorder])),
    Shape(id:6, resourceName: "shape-07", attributes: Set([.IsGreen, .HasCurvedSides, .IsSolid, .HasBorder])),
    Shape(id:7, resourceName: "shape-08", attributes: Set([.IsGreen, .HasStraightSides, .IsPatterned, .HasLinedPattern, .IsRectangle])),
    Shape(id:8, resourceName: "shape-09", attributes: Set([.IsOrange, .HasStraightSides, .IsSolid, .HasHole])),
    Shape(id:9, resourceName: "shape-10", attributes: Set([.IsOrange, .HasStraightSides, .HasBorder, .IsPatterned, .HasGridPattern])),
    Shape(id:10, resourceName: "shape-11", attributes: Set([.IsPurple, .HasStraightSides, .HasHole, .IsSolid])),
    Shape(id:11, resourceName: "shape-12", attributes: Set([.IsPurple, .HasStraightSides, .IsPatterned, .HasGridPattern, .HasBorder])),
    Shape(id:12, resourceName: "shape-13", attributes: Set([.IsRed, .HasStraightSides, .IsSolid, .HasBorder])),
    Shape(id:13, resourceName: "shape-14", attributes: Set([.IsRed, .HasStraightSides, .IsPatterned, .HasDotPattern, .IsRectangle])),
    Shape(id:14, resourceName: "shape-15", attributes: Set([.IsYellow, .HasCurvedSides, .IsSolid, .HasBorder])),
    Shape(id:15, resourceName: "shape-16", attributes: Set([.IsYellow, .HasStraightSides, .IsPatterned, .HasLinedPattern, .IsRectangle])),
]

public func shuffleShapes(shapes: [Shape]) -> [Shape] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Shapes) as! [Shape]
}
