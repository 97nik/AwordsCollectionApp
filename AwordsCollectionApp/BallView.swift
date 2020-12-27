//
//  CurvesView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct BallView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.height, geometry.size.width)
            let nearLine = size * 0.15
            let farLine = size * 0.85
            
            Circle()
                .fill(Color.orange)
                .frame(width: size)
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: nearLine, y: nearLine),
                    radius: CGFloat(60),
                    startAngle: .degrees(115),
                    endAngle: .degrees(-25),
                    clockwise: true
                )
            }
            .stroke(Color.black, lineWidth: 2)
            
            Path { path in
                
                path.addArc(
                    center: CGPoint(x: farLine, y: farLine),
                    radius: CGFloat(60),
                    startAngle: .degrees(295),
                    endAngle: .degrees(155),
                    clockwise: true
                )
                
            }
            .stroke(Color.black, lineWidth: 2)
            
            Path { path in
                path.move(to: CGPoint(x: farLine, y: nearLine))
                path.addLine(to: CGPoint(x: nearLine, y: farLine))
            }
            .stroke(Color.black, lineWidth: 2)
            
            Path { path in
                path.move(to: CGPoint(x: nearLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine, y: farLine))
            }
            .stroke(Color.black, lineWidth: 2)
        }
        .frame(width: width, height: height)
    }
}


struct CurvesView_Previews: PreviewProvider {
    static var previews: some View {
        BallView(width: 200, height: 200)
    }
}
