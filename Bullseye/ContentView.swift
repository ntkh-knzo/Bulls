//
//  ContentView.swift
//  Bullseye
//
//  Created by Kenzo on 2/10/22.
//

/**
 git add .
  git commit -m "sjdqwfjqwb"
  git push -u origin main
 */

import SwiftUI

struct ContentView: View {
    @State var alertIsVis = false
    @State var sliderValue = 50.0
    @State var targetValue = Int.random(in: 0...100)
    
    //single source of truth slider value
    var sliderValRounded: Int{
        Int(self.sliderValue.rounded())
    }
    
    //UI content and layout
    var body: some View {
        VStack {
            
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .fontWeight(.semibold)
                Text("\(targetValue)")
            }
            
            Spacer()
            //Slider row
            // TODO: add views for slider row here.
            HStack{
                Text("1")
                Slider(value: self.$sliderValue,
                       in:1...100)
                Text("100")
            }
            
            // Button row
            Button("Hit me!") {
                print("Points awarded: \(scoreCalculator())")
                print("Button pressed!")
                self.alertIsVis = true
            }
            .alert(isPresented: self.$alertIsVis){
                Alert(
                    title: Text("Hello there!"),
                    message: Text(scoringMessage()),
                    dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            // Score row
            // TODO: add views for the score, rounds, and start and info buttons
            HStack{
                Button("Start over"){
                    
                }
                Spacer()
                Text("Score:")
                Text("9999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button("Info"){
                    
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    // Methods
    // =======
    /**
     var sliderValue:
     var targetValue:*/
    func scoreCalculator()-> Int{
        let diff = abs(sliderValRounded - targetValue)
        return 100 - diff
    }
    
    func scoringMessage()-> String{
        return "The slider value is \(sliderValRounded).\n" +
        "The target value is \(targetValue).\n" +
        "You scored \(scoreCalculator()) points this round."
    }
}



// Preview
// =======









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
