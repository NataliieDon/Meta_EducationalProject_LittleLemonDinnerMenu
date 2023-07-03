//
//  MenuItemDetailsView.swift
//  LL dinner menu
//
//  Created by Nataliia Dontsova on 01.07.2023.
//

import SwiftUI
protocol MenuItemProtocol: Identifiable {
    var id: UUID {get}
    var price: Double {get}
    var title: String {get}
    var menuCategory: MenuCategory {get}
    var odersCount: Int {get set}
    var priceInt: Int {get set}
    var ingredients: [Ingredient] {get set}
}


  struct MenuItemDetailsView: View {
      @Environment(\.presentationMode)
      var presentationMode

      class MenuViewViewModel {
         var foodMenuItems: [MenuItem]
         var drinkMenuItems: [MenuItem]
         var dessertMenuItems: [MenuItem]
         
         init() {
             foodMenuItems = []
             drinkMenuItems = []
             dessertMenuItems = []
         }
          
     }
      
     class MenuItem: MenuItemProtocol {
         var id: UUID
         var price: Double
         var title: String
         var menuCategory: MenuCategory
         var odersCount: Int
         var priceInt: Int
         var ingredients: [Ingredient]
         
         init(id: UUID, price: Double, title: String, menuCategory: MenuCategory, odersCount: Int, priceInt: Int, ingredients: [Ingredient]) {
             self.id = id
             self.price = price
             self.title = title
             self.menuCategory = menuCategory
             self.odersCount = odersCount
             self.priceInt = priceInt
             self.ingredients = ingredients
         }
         
     }
      var item = MenuItem(id: UUID(), price: 0.0, title: "Any name", menuCategory: MenuCategory.food, odersCount: 0000, priceInt: 0, ingredients: [])
      
      
     var body: some View {
         VStack {
             Text(item.menuCategory.rawValue)
                 .foregroundColor(Color.gray)
                 .font(.title)
                 .bold()
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .padding(.leading, 20)
             Text(item.title)
                 .font(.title)
                 .bold()
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .padding(.leading, 20)
             
             Image("Little Lemon logo")
                 .resizable()
                 .scaledToFit()
                 .frame(width: 200, height: 400, alignment: .top)

             
             
             VStack {
                 Text("Price:")
                     .font(.headline)
                 
                 Text("\(String(format: "%.2f", item.price))")
                     .font(.subheadline)
                     .multilineTextAlignment(.center)
                 
                 Text("Ordered:")
                     .font(.headline)
                 Text("\(item.odersCount)")
                     .font(.subheadline)
                     .multilineTextAlignment(.center)
                 Text("Ingredients:")
                     .font(.headline)
                 
                 ForEach(item.ingredients, id: \.self) { ingredient in
                     Text(ingredient.rawValue)
                 }
                 .font(.subheadline)
                 .multilineTextAlignment(.center)
                 
                 
             }
             
             
         }
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(leading: backButton)
         
    }
     
      var backButton: some View {
              Button(action: {
                  presentationMode.wrappedValue.dismiss()
              }) {
                  HStack {
                      Image(systemName: "chevron.left")
                      Text("Menu")
                  }
              }
          }
      }

                
struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView()
    }
}
