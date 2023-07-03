//
//  MenuItemsView.swift
//  LL dinner menu
//
//  Created by Nataliia Dontsova on 01.07.2023.
//

import SwiftUI
public struct MenuItem: Identifiable {
   
   public let id = UUID()
   var title: String = ""
   var ingredients: [Ingredient] = []
}


 struct MenuItemsView: View {
   
     @State private var showOptions = false
    
     
     var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: MenuItemsOptionView(), isActive: $showOptions) {
                    EmptyView()
                }
                Button(action: {
                    showOptions = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 20)
                        .padding(.trailing, 20)
                }
                
                Text("Menu")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                Spacer()
                
                
                
                let foodMenuItems: [MenuItemDetailsView.MenuItem] = [
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 111.1, title: "Pasta with tomatoes", menuCategory: MenuCategory.food, odersCount: 2345, priceInt: 111, ingredients: [.pasta, .sauceTomato]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 222.2, title: "Pasta with broccoli", menuCategory: MenuCategory.food, odersCount: 4556, priceInt: 222, ingredients: [.pasta, .broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 333.3, title: "Pasta with carrot", menuCategory: MenuCategory.food, odersCount: 347, priceInt: 333, ingredients: [.pasta, .carrot]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 444.4, title: "Pasta with spinach", menuCategory: MenuCategory.food, odersCount: 390, priceInt: 444, ingredients: [.pasta, .spinach]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 555.5, title: "Pasta with spinach and broccoli", menuCategory: MenuCategory.food, odersCount: 1111, priceInt: 555, ingredients: [.pasta, .spinach, .broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 666.6, title: "Pasta with tomato sauce and broccoli", menuCategory: MenuCategory.food, odersCount: 6, priceInt: 667, ingredients: [.pasta, .sauceTomato, .broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 777.7, title: "Salad with vegetables", menuCategory: MenuCategory.food, odersCount: 886, priceInt: 778, ingredients: [.broccoli, .carrot, .spinach, .sauceTomato]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 888.8, title: "Only pasta", menuCategory: MenuCategory.food, odersCount: 953, priceInt: 889, ingredients: [.pasta]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 999.9, title: "Only sauce", menuCategory: MenuCategory.food, odersCount: 443, priceInt: 1000, ingredients: [.sauceTomato]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 45.8, title: "Only carrot", menuCategory: MenuCategory.food, odersCount: 653, priceInt: 46, ingredients: [.carrot]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 76.65, title: "Only broccoli", menuCategory: MenuCategory.food, odersCount: 753, priceInt: 77, ingredients: [.broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 420.84, title: "Only spinach", menuCategory: .food, odersCount: 24864, priceInt: 421, ingredients: [.spinach])
                ]
                
                let drinkMenuItems: [MenuItemDetailsView.MenuItem] = [
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 55.88, title: "Carrot", menuCategory: MenuCategory.drink, odersCount: 8632, priceInt: 56, ingredients: [.carrot]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 555.2, title: "Broccoli", menuCategory: .drink, odersCount: 666644, priceInt: 555, ingredients: [.broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 776.88, title: "Spinach", menuCategory: MenuCategory.drink, odersCount: 8864, priceInt: 777, ingredients: [.spinach]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 555.9, title: "Tomatoes and Broccoli", menuCategory: MenuCategory.drink, odersCount: 887, priceInt: 556, ingredients: [.sauceTomato, .broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 6663.0, title: "Tomatoes and Carrot", menuCategory: MenuCategory.drink, odersCount: 8764, priceInt: 6663, ingredients: [.carrot, .sauceTomato]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 653.09, title: "Broccoli and carror", menuCategory: MenuCategory.drink, odersCount: 87532, priceInt: 653, ingredients: [.broccoli, .carrot]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 5432.98, title: "Spinach and carrot", menuCategory: MenuCategory.drink, odersCount: 6654, priceInt: 5433, ingredients: [.spinach, .carrot]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 654.8, title: "Broccoli and Spinach", menuCategory: MenuCategory.drink, odersCount: 64325, priceInt: 655, ingredients: [.broccoli, .spinach])
                ]
                
                let dessertMenuItems: [MenuItemDetailsView.MenuItem] = [
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 6543.98, title: "Carrot pie", menuCategory: MenuCategory.dessert, odersCount: 65439, priceInt: 6544, ingredients: [.carrot]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 65.98, title: "Broccoli pie", menuCategory: MenuCategory.dessert, odersCount: 4433, priceInt: 66, ingredients: [.broccoli]),
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 432.8, title: "Spinach pie", menuCategory: MenuCategory.dessert, odersCount: 6543, priceInt: 433, ingredients: [.spinach]),
                    
                    MenuItemDetailsView.MenuItem(id: UUID(), price: 765.7, title: "Pasta pie", menuCategory: MenuCategory.dessert, odersCount: 76, priceInt: 766, ingredients: [.pasta])
                ]
                
                
                let gridItems: [GridItem] = [
                    GridItem(.flexible(), spacing: 5),
                    GridItem(.flexible(), spacing: 5),
                    GridItem(.flexible(), spacing: 5)
                ]
                
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 10) {
                        Section(header: Text("Food")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 20)
                            .padding(.leading, 20)
                        ) {
                            ForEach(foodMenuItems) { item in
                                NavigationLink(destination: MenuItemDetailsView(item: item)) {
                                    VStack {
                                        Rectangle()
                                            .frame(width: 125, height: 90)
                                            .padding(.leading, 20)
                                            .padding(.trailing, 20)
                                            .foregroundColor(Color.black)
                                        Text(item.title)
                                            .font(.headline)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(nil)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color.black)
                                    }
                                        
                                    }
                                    .frame(width: 100, height: 100, alignment: .top)
                                    .padding(40)
                                    
                                }
                            }
                            
                            Section(header: Text("Drink")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 20)
                                .padding(.leading, 20)
                            ) {
                                ForEach(drinkMenuItems) { item in
                                    NavigationLink(destination: MenuItemDetailsView(item: item)) {
                                        VStack {
                                            Rectangle()
                                                .frame(width: 125, height: 90)
                                                .padding(.leading, 20)
                                                .padding(.trailing, 20)
                                                .foregroundColor(Color.black)
                                            Text(item.title)
                                                .font(.headline)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .lineLimit(nil)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color.black)
                                        }
                                    }
                                }
                            }
                                
                                Section(header: Text("Dessert")
                                    .font(.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 20)
                                    .padding(.leading, 20)
                                ) {
                                    ForEach(dessertMenuItems) { item in
                                        NavigationLink(destination: MenuItemDetailsView(item: item)) {
                                            VStack {
                                                Rectangle()
                                                    .frame(width: 125, height: 90)
                                                    .padding(.leading, 20)
                                                    .padding(.trailing, 20)
                                                    .foregroundColor(Color.black)
                                                Text(item.title)
                                                    .font(.headline)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .lineLimit(nil)
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(Color.black)
                                            }
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
        
                }
            }
        }

    
struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
