//
//  ContentView.swift
//  Bullseye
//
//  Created by Vincent Gunawan on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundViews(game: $game)
            VStack{
                InstructionView(text: "put the bullseye as close as you can to")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                bigNumberText(text: String(game.target))
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
                        .transition(.scale)
                } else {
                    buttonView(alertIsVisible: $alertIsVisible, game: $game, sliderValue: Int(sliderValue))
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                sliderView(sliderValue: $sliderValue)
                                .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
