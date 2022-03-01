//
//  BackgroundViews.swift
//  Bullseye
//
//  Created by Vincent Gunawan on 27/12/21.
//

import SwiftUI

struct BackgroundViews: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingView())
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack{
            LabelText(title: title.uppercased())
            RoundRectTextView(text: text)
            
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) {ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                            RadialGradient(gradient: Gradient(colors: [Color("ringColor").opacity(0.8*opacity), Color("ringColor").opacity(0)]), center: .center, startRadius: 100.0, endRadius: 300.0)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundViews_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundViews(game: .constant(Game()))
            .previewInterfaceOrientation(.landscapeRight)
        BackgroundViews(game: .constant(Game()))
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
