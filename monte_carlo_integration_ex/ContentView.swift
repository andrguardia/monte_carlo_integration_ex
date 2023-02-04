//
//  ContentView.swift
//  monte_carlo_integration_ex
//
//  Created by IIT Phys 440 on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    @State  var nString: String = ""
    @State  var lowerBoundString: String = ""
    @State  var upperBoundString: String = ""
    @State  var integralValueMonteCarlo: Double = 0.0
    @State var insideData = [(xPoint: Double, yPoint: Double)]()
    @State var outsideData = [(xPoint: Double, yPoint: Double)]()
    
    @ObservedObject var montecarlo = monteCarlo()
    
    var body: some View {
        
        
        HStack{
            
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Monte Carlo Integration for e^x")
                
                HStack {
                    Text("Number of Samples:")
                    TextField("Enter a value for n", text: $nString)
                }
                HStack {
                    Text("Lower X Bound:")
                    TextField("Enter a value for the lower x bound", text: $lowerBoundString)
                }
                HStack {
                    Text("Upper X Bound:")
                    TextField("Enter a value for the upper x bound", text: $upperBoundString)
                }
                
                Button("Compute!", action: {self.calculate()})
                
                HStack {Text("Integral Value:")
                    Text("\(self.integralValueMonteCarlo, specifier: "%.7f")")
                }
                
            }
            .padding()
            
            //DrawingField
            
            
            drawingView(redLayer:$montecarlo.insideData, blueLayer: $montecarlo.outsideData)
                .padding()
                .aspectRatio(1, contentMode: .fit)
            // Stop the window shrinking to zero.
            Spacer()
        }
    }
    
    func calculate(){
        
       
        montecarlo.n = Int(nString)!
        montecarlo.lowerBoundX = Double(lowerBoundString)!
        montecarlo.upperBoundX = Double(upperBoundString)!
        
        montecarlo.computeAll()
        integralValueMonteCarlo = montecarlo.integralValue
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
