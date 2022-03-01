//
//  PointsView.swift
//  Bullseye
//
//  Created by Vincent Gunawan on 29/12/21.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    @Binding var sliderValue: Double
    
    var body: some View {
        let points = game.points(sliderValue: Int(sliderValue))
        
        VStack(spacing: 10){
            InstructionView(text: "the slider's value is".uppercased())
            bigNumberText(text: String(Int(sliderValue)))
            bodyText(title: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                withAnimation{
                    alertIsVisible = false
                    game.startNewRound(points: points)
                }
            }) {
                buttonText(title: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("backgroundColor"))
        .cornerRadius(Constants.General.cornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
            .previewInterfaceOrientation(.landscapeRight)
        PointsView(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
