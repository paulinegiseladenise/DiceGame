//
//  ContentView.swift
//  DiceGame
//
//  Created by Pauline Broängen on 2022-09-29.
//

import SwiftUI

struct ContentView: View {
    
    //koden lägger man i contentview men utanför bodyn...
    
    //@State är att den håller koll på värdet åt oss. värdena kan komma att ändras.
   @State var dice1 = 1
    @State var dice2 = 1
    @State var score = 0
    @State var showWinModal = false
    
    
    func rollDices() {
    
        dice1 = Int.random(in: 1...6)
        dice2 = Int.random(in: 1...6)
        
        score += dice1 + dice2
        if score >= 10 {
            print("Win!")
            showWinModal = true
        }
    }
    

    
    
    var body: some View {
        
        ZStack { //vi har bara färgen i z
         
            Color.init(red: 184/255, green: 108/255, blue: 181/255).ignoresSafeArea()
            
        
            
            VStack { //vårat innehåll, som ligger ovanför färgen
               
                Spacer()
                Text("Welcome to the casino").font(.title).bold().padding().foregroundColor(.white)
                
                Text("Score: \(score)").font(.system(size: 30, weight: .bold)).bold().padding()


                Spacer()
            
            
            
            HStack {
                Spacer()
                Image("dice-\(dice1)")
                Spacer()
                Image("dice-\(dice2)")
                Spacer()
            }
                Spacer()
                
                Button(action: {
                    rollDices()
                    
                }, label: {
                  
                    primaryButton(buttonText: "Var snäll och tryck för att spela", buttonImage: "person.circle")
                })
                Spacer()
            
            }
            
            //nedanför gör vi en ny modal och kommer lära oss mer om binding.
        }.sheet(isPresented: $showWinModal, onDismiss: {
            score = 0
            print("View dismissed!")
                }, content: {
                    WinModal()
        })
        
}
}

//nedanför är också en ny modal
    struct WinModal: View {
        var body: some View {
          
            
            ZStack { //vi har bara färgen i z
            
                Color.init(red: 184/255, green: 108/255, blue: 181/255).ignoresSafeArea()
            
                Text("Du vann spelet! Woho!")
                
        }
    }
    }




//nedanför definierar vi en knapp som vi hela tiden använder
struct primaryButton: View {
    var buttonText: String
    var buttonImage: String
    var body: some View {
        
        HStack {
            Image(systemName: buttonImage).resizable().frame(width: 20, height: 20, alignment: .leading);Text(buttonText)
        }.padding().foregroundColor(.white).background(.black).cornerRadius(10)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
        
