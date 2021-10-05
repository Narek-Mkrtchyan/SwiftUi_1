//
//  ContentView.swift
//  MyProject3
//
//  Created by Haykaz Melikyan on 10/5/21.
//  Copyright © 2021 Varsenik Shahbazyan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    @State var show = false
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading, spacing: 12){
                    Image("avatar")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    
                    Text("Hi!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("Narek")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Button(action: {
                        self.index = 0
                        
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack (spacing: 25){
                            Image("catalogue")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(self.index == 0 ? Color(.brown) : Color(.white))
                            Text("Catalog")
                                .foregroundColor(self.index == 0 ? Color(.brown) : Color(.white))
                        }.padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color(.brown).opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }.padding(.top, 25)
                    
                    Button(action: {
                        self.index = 1
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack (spacing: 25){
                            Image("cart")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(self.index == 1 ? Color(.brown) : Color(.white))
                            Text("Cart")
                                .foregroundColor(self.index == 1 ? Color(.brown) : Color(.white))
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 1 ? Color(.brown).opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 2
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack (spacing: 25){
                            Image("fav")
                                .resizable()
                                .frame(width: 27,height: 27)
                                .foregroundColor(self.index == 2 ? Color(.brown) : Color(.white))
                            Text("Favorite")
                                .foregroundColor(self.index == 2 ? Color(.brown) : Color(.white))
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 2 ? Color(.brown).opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 3
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack (spacing: 25){
                            Image("order")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(self.index == 3 ? Color(.brown) : Color(.white))
                            Text("Order")
                                .foregroundColor(self.index == 3 ? Color(.brown) : Color(.white))
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 3 ? Color(.brown).opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    Button(action: {
                        //
                    }){
                        HStack{
                            Image("out")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(.white)
                            Text("Exit")
                                .foregroundColor(.white)
                        }.padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    Spacer(minLength: 0)
                    
                }.padding(.top, 25)
                    .padding(.horizontal, 20)
                
                
                Spacer(minLength: 0)
                
                
            }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            
            VStack(spacing: 0){
                HStack(spacing: 15){
                    Button(action: {
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3" )
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    Text(self.index == 0 ? "Cotolog" : (self.index == 1 ? "Cart" : (self.index == 2 ? "Fovorit": "Orders")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader{_ in
                    VStack{
                        if self.index == 0 {
                            Catalogue()
                        } else if self.index == 1 {
                            Cart()
                        } else if self.index == 2 {
                                                   Fav()
                        }else{
                            Orders()
                        }
                    }
                }
                
            }
            .background(Color.white)
                  .cornerRadius(self.show ? 30 : 0)
                  .scaleEffect(self.show ? 0.9 : 1)
                  .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
                  .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }.background(Color(.black).edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.all)
      
    }
}

struct Catalogue: View{
    var body: some View{
        VStack{
            Text("Catalog")
        }
    }
}

struct Cart: View{
    var body: some View{
        VStack{
            Text("Cart")
        }
    }
}

struct Orders: View{
    var body: some View{
        VStack{
            Text("Orders")
        }
    }
}

struct Fav: View{
    var body: some View{
        VStack{
            Text("Favorit")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
