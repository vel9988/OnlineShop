//
//  Resources.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 11.03.2023.
//

import UIKit

typealias R = Resources

enum Resources {
    
    // MARK: - Color
    
    enum Color {
        static let background = UIColor(named: "background")!
        static let universalBlue = UIColor(named: "universalBlue")!
        static let textField = UIColor(named: "textField")!
        static let grayText = UIColor(named: "grayText")!
    }
    
    // MARK: - Image
    
    enum Image {
        static let ellipse = UIImage(named: "ellipse")!
        static let mockImage = UIImage(systemName: "photo.stack.fill")!
        
        enum TabBar {
            static let home = UIImage(named: "home")!
            static let shoppingCart = UIImage(named: "shoppingCart")!
            static let favourites = UIImage(named: "favourites")!
            static let profile = UIImage(named: "profile")!
            static let chat = UIImage(named: "chat")!
            static let selected = UIImage(named: "selected")!
        }
        
        enum Home {
            static let geoPin = UIImage(named: "geoPin")!
            static let downArrow = UIImage(named: "downArrow")!
            static let filter = UIImage(named: "filter")!
            static let phones = UIImage(named: "phones")!
            static let computer = UIImage(named: "computer")!
            static let health = UIImage(named: "health")!
            static let books = UIImage(named: "books")!
            static let products = UIImage(named: "products")!
            static let magnifier = UIImage(named: "magnifier")!
            static let qr = UIImage(named: "qr")!
            static let close = UIImage(named: "close")!
            static let downArrowBig = UIImage(named: "downArrowBig")!
            static let heart = UIImage(named: "heart")!
            static let heartFill = UIImage(named: "heart.fill")!
            
            static let leftArrow = UIImage(named: "leftArrow")!
            static let productBasket = UIImage(named: "productBasket")!
            static let productLike = UIImage(named: "productLike")!
            static let star = UIImage(named: "star")!
            static let cpu = UIImage(named: "cpu")!
            static let camera = UIImage(named: "camera")!
            static let memory = UIImage(named: "memory")!
            static let storage = UIImage(named: "storage")!
            static let like = UIImage(systemName: "heart")!
            static let likeFill = UIImage(systemName: "heart.fill")!
            static let check = UIImage(named: "check")!
            
            static let locationPin = UIImage(named: "locationPin")!
            static let trash = UIImage(named: "trash")!
        }
    }
    
    // MARK: - Text
    
    enum Text {
        enum Home {
            static let locationTitle = "Bishkek"
            static let category = "Select Category"
            static let hotSales = "Hot Sales"
            static let bestSeller = "Best Seller"
            static let viewAll = "view all"
            static let seeMore = "see more"
            static let phones = "Phones"
            static let computer = "Computer"
            static let health = "Health"
            static let books = "Books"
            static let products = "Products"
            static let searchPlaceholder = "Search"
            static let explorer = "Explorer"
            static let done = "Done"
            static let filterOptions = "Filter options"
            static let brand = "Brand"
            static let price = "Price"
            static let size = "Size"
            static let newLabel = "New"
            static let buyNow = "Buy now!"
            
            static let productDetails = "Product Details"
            static let addToCart = "Add to Cart"
            static let shop = "Shop"
            static let details = "Details"
            static let features = "Features"
            static let selection = "Select color and capacity"
            
            static let addAddress = "Add address"
            static let myCart = "My Cart"
            static let total = "Total"
            static let delivery = "Delivery"
            static let checkout = "Checkout"
            static let minus = "-"
            static let plus = "+"
        }
        
        enum Basket {
            static let basket = "Basket"
            static let empty = "Your basket is empty"
        }
        
        enum Favorites {
            static let favorites = "Favorites"
            static let empty = "Your favorites are empty"
        }
        
        enum Profile {
            static let profile = "Profile"
        }
        
        enum Url {
            static let latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
            static let flashSale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
            static let productDetails = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
            static let search = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
            static let profile = "https://github.com/vel9988"
        }
        
        enum NotificationKey {
            static let tabBarAppearance = "tabBarAppearance"
            static let tabBarGoHome = "tabBarGoHome"
            static let tabBarCounter = "tabBarCounter"
        }
    }
    
    // MARK: - Font
    
    enum Font {
        case light
        case regular
        case medium
        case bold
        
        static func montserrat(type: Self, size: CGFloat) -> UIFont {
            var fontName = ""
            
            switch type {
            case .light:
                fontName = "Montserrat-Light"
            case .regular:
                fontName = "Montserrat-Regular"
            case .medium:
                fontName = "Montserrat-Medium"
            case .bold:
                fontName = "Montserrat-Bold"
            }
            
            return UIFont(name: fontName, size: size)!
        }
    }
    
}

