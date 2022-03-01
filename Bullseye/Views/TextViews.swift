//
//  TextViews.swift
//  Bullseye
//
//  Created by Vincent Gunawan on 26/12/21.
//

import SwiftUI

struct InstructionView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("textColor"))
    }
}

struct bigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .fontWeight(.black)
            .font(.largeTitle)
            .foregroundColor(Color("textColor"))
    }
}

struct sliderLabelText: View{
    var text: String
    var body: some View{
        Text(text)
            .bold()
            .foregroundColor(Color("textColor"))
            .frame(width: 35.0)
    }
}

struct sliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View{
        HStack{
            sliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.00...100.00)
            sliderLabelText(text: "100")
        }
    }
}

struct buttonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    var sliderValue: Int
    
    var body: some View{
        Button(action: {
            withAnimation {
                self.alertIsVisible = true
            }
        }){
            Text("hit me")
                .bold()
                .font(.title3)
                .textCase(.uppercase)
        }
        .padding(20.0)
        .background(ZStack {
            Color("buttonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.cornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}

struct LabelText: View {
    var title: String
    
    var body: some View{
        Text(title)
            .bold()
            .foregroundColor(Color("textColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct bodyText: View {
    var title: String
    
    var body: some View{
        Text(title)
            .foregroundColor(Color("textColor"))
            .font(.footnote)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct scoreText: View {
    var score: Int
    
    var body: some View{
        Text(String(score))
            .kerning(-0.2)
            .fontWeight(.bold)
            .font(.title2)
            .foregroundColor(Color("textColor"))
    }
}

struct dateText: View {
    var date: Date
    
    var body: some View{
        Text(date, style: .time)
            .kerning(-0.2)
            .fontWeight(.bold)
            .font(.title2)
            .foregroundColor(Color("textColor"))
    }
}

struct buttonText: View {
    var title: String
    
    var body: some View{
        Text(title)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color("AccentColor"))
            .cornerRadius(12.0)
    }
}

struct headerText: View {
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .fontWeight(.black)
            .font(.title)
            .foregroundColor(Color("textColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionView(text: "Instructions")
            bigNumberText(text: "99")
            bodyText(title: "You scored 200 points\n🎉🎉🎉")
            buttonText(title: "Start New Round")
            
            scoreText(score: 100)
            dateText(date: Date())
            headerText(text: "leaderboard")
        }
        .padding()
    }
}
