//
//  ActivityAttributes.swift
//  Demo
//
//  Created by Rodrigo Mendez on 23/11/22.
//

import Foundation
import ActivityKit

// Notification
struct NotificationAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
}

// FoodOrder
struct FoodOrderAttributes: ActivityAttributes {
  public typealias FoodOrderStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
  var image: String
}
