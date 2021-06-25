//
//  SearchBarView.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText = ""
    let lister = tester
    @State var showEdit = false
    
//    @State var newname: String = ""
//    @State var newdesc: String = ""
//    @State var newpopupper: Double = 0
//    @State var newpopmiddle: Double = 0
//    @State var newpoplower: Double = 0

    @ObservedObject var foodListVM = FoodListViewModel()
    var body: some View {
                NavigationView{
                    ZStack{
                    coloring
                        VStack{
                            searchBar
                                
                            ScrollView( showsIndicators: false){
                                LazyVStack{
                                    ForEach((foodListVM.foodViewModel.indices).filter({"\(foodListVM.foodViewModel[$0].food.name)".contains(searchText) || searchText.isEmpty}), id: \.self){ index in
                            HStack{
                                Text(foodListVM.foodViewModel[index].food.name)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(.red)
                                    .shadow(color: .secondary, radius: 7, y: 5)
                            }
                        }
                    }
                            }.fullScreenCover(isPresented: $showEdit, content: {
                                EditScreen()
                            })
                            Spacer()
                        }.navigationBarTitle("Food Info")
                    }.navigationBarItems(trailing:
                                            Button(action: {showEdit.toggle()} , label: {
                                                Image(systemName: "plus").resizable().foregroundColor(.white)
                                                    .frame(width: 25, height: 25)
                                                    .scaledToFit()
                                                    .padding(.horizontal, 5)
                                                    .padding(.top)
                                                    .shadow(color: .secondary, radius: 2, y: 4)
                                            })
                                            
                                         
                    )
                }
               
            
        
    }
}


struct EditScreen: View {
    @State var newname: String = ""
    @State var newdesc: String = ""
    @State var newpopupper: Double = 3
    @State var newpopmiddle: Double = 3
    @State var newpoplower: Double = 3
    

    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View{
       
            ZStack{
                
                
                Color.red.ignoresSafeArea()
                ScrollView{
                VStack{
                    HStack{
                        Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding()
                        
                    })
                        Spacer()
                    }.padding(.bottom, -40)
                    Text("Add New Food Item")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.top)
                        .padding(.bottom, -15)
                        .overlay(
                            Capsule(style: .continuous)
                                .frame(height: 4)
                                .offset(y: 5)
                                .foregroundColor(.white)
                        , alignment: .bottom)
                    HStack{
                    Text("Enter the name here: ")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.bottom, -20)
                    Spacer()
                    }
                    TextField("Name", text: $newname)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                        .shadow(color: .secondary, radius: 10, y: 10 )
                    
                    HStack{
                    Text("Enter the Description here: ")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.bottom, -20)
                    Spacer()
                    }
                    
                  
                        
                        TextEditor(text: $newdesc)
                            .font(.footnote)
                            .frame(height: 120)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.top, 5)
                            .shadow(color: .secondary, radius: 10, y: 8)
                            
                   
                    sliderupper
                    
                    slidermiddler
                    
                    sliderlower
                    
                    submittButton
                   
                    }
                }
            }
        
       
        }
        
    }




struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
       EditScreen()
    }
}


extension SearchBarView{
    private var coloring: some View{
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))]),
            center: .topLeading,
            startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/,
            endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        
        
        
    }
    

        
        
    
    
    private var searchBar: some View{
        TextField("Search", text: $searchText)
            .padding(.horizontal)
            .padding()
            
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        
                    
                    Spacer()
                }
                .padding(10)
                
            )
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            .shadow(color: .secondary, radius:10, y:5)
            
        
        
    }
    
    
    
    
    
}



//MARK: EJASDOJASODJ
extension EditScreen{
   
    private var sliderupper: some View{
        
        VStack{
        HStack{
        Text("Enter the Upper School Popularity here: ")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, -20)
        Spacer()
        }
        .padding(.top)
        Text(
            String(format: "%.0f",  newpopupper)
    )
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
        .padding(.top)
            
            Slider(value: $newpopupper, in: 1...5, step: 1.0)
                .accentColor(.white)
                .padding(.horizontal)
                .shadow(color: .secondary, radius: 10, y: 8)
        }
    }
    
    private var sliderlower: some View{
        
        VStack{
        HStack{
        Text("Enter the Lower School Popularity here: ")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, -20)
        Spacer()
        }
        .padding(.top)
        Text(
            String(format: "%.0f",  newpoplower)
    )
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
        .padding()
            
            Slider(value: $newpoplower, in: 1...5, step: 1.0)
                .accentColor(.white)
                .padding(.horizontal)
                .shadow(color: .secondary, radius: 10, y: 8)
        }
    }
    
    private var slidermiddler: some View{
        
        VStack{
        HStack{
        Text("Enter the Middle School Popularity here: ")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, -20)
        Spacer()
        }
        .padding(.top)
        Text(
            String(format: "%.0f",  newpopmiddle)
    )
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
        .padding()
            
            Slider(value: $newpopmiddle, in: 1...5, step: 1.0)
                .accentColor(.white)
                .padding(.horizontal)
                .shadow(color: .secondary, radius: 10, y: 8)
                
            
        }
    }
    
    
    private var submittButton: some View{
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Submit")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color.blue)
                .accentColor(.white)
                .cornerRadius(10)
                .shadow(color: .secondary, radius: 7, y: 5)
                .padding()
        })
    }
    
}
