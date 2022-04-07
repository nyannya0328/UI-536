//
//  Home.swift
//  UI-536
//
//  Created by nyannyan0328 on 2022/04/07.
//

import SwiftUI

struct Home: View {
    @State var currentTab : Trip = trips[0]
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                
                Image(currentTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    
                
                
                
            }
            VStack(spacing:15){
                
                
                Text("Lets Go With")
                    .font(.title)
                
                Text("Proco Trip")
                    .font(.largeTitle.weight(.bold))
                
                
                VStack(spacing:10){
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        TabView(selection: $currentTab) {
                            
                            
                            ForEach(trips){trip in
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .cornerRadius(10)
                                    .tag(trip)
                                
                            }
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                    }
                    .frame(height:UIScreen.main.bounds.height / 2.3)
                    
                    Text(currentTab.title)
                        .font(.title.weight(.black))
                        .foregroundColor(.black)
                    
                    
                    HStack(spacing:15){
                        
                        
                        ForEach(trips){trip in
                            
                            Circle()
                                .fill(currentTab == trip ? .red : .black)
                                .frame(width: currentTab == trip ? 15 : 5, height: currentTab == trip ? 15 : 5)
                                .animation(.spring(), value: currentTab)
                            
                        }
                    }
                    .padding()
              
                    
                    
                    
                }
                .padding(20)
                .padding(.horizontal)
                .background(Color.white.clipShape(CustomShape()))
                .padding(.horizontal)
                .shadow(radius: 5)
              
                
                
                
            }
            .padding(.vertical)
            .foregroundColor(.white)
            
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            let midWidth = rect.width / 2
            
            path.addLine(to: CGPoint(x: midWidth - 80, y: rect.height))
            path.addLine(to: CGPoint(x: midWidth - 70, y: rect.height - 25))
            path.addLine(to: CGPoint(x: midWidth + 70, y: rect.height - 25))
            
            
            path.addLine(to: CGPoint(x: midWidth + 80, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
        }
    }
}
