//
//  PurchasesManage.swift
//  LBPurchases
//
//  Created by Luis Alvarez on 4/26/25.
//

import LBFoundation
import RevenueCat
import SwiftUI

public extension Features {
    
    static var purchases: PurchasesManager {
        shared.fetchFeature(featureKey: PurchasesManager.featureKey) as! PurchasesManager
    }
}

@Observable
public class PurchasesManager: LBFeature {
  
    public static let featureKey: String = "PurchasesManager"

    public static func initialize(debugLogLevel: Bool = true, apiKey: String) {
        if debugLogLevel {
            Purchases.logLevel = .debug
        }
        Purchases.configure(withAPIKey: apiKey)
    }
    
    internal var subscriptionState = SubscriptionState(subscriptionPeriod: .Inactive)
    
    /**Debug settings**/
    public var __STATIC = false
    
    public var membershipScreenPresented = false
    
    public var isSubscribed: Bool {
        subscriptionState.subscriptionPeriod == .Active
    }
    
    public var hasTrial: Bool {
        subscriptionState.hasTrial
    }
    
    public init() {

    }
    
    public func fetchSubscriptionState(_ entitlement: String = "") async {
        guard !__STATIC else { return }
        let customerInfo = try? await Purchases.shared.customerInfo()
        updateCustomerInfo(customerInfo, entitlementRequested: entitlement)
    }
    
    public func restorePurchases(_ showMessage: Bool = false) async {
        guard !__STATIC else { return }
        let customerInfo = try? await Purchases.shared.restorePurchases()
        updateCustomerInfo(customerInfo)
    }
    
    private func updateCustomerInfo(_ customerInfo: CustomerInfo?, entitlementRequested: String = "") {
        guard let customerInfo = customerInfo else { return }
        
        let isSubscribed: Bool = if entitlementRequested.isEmpty {
            !customerInfo.entitlements.active.isEmpty
        } else {
            customerInfo.entitlements[entitlementRequested]?.isActive == true
        }
        
        subscriptionState = SubscriptionState(subscriptionPeriod: isSubscribed ? .Active : .Inactive, customerInfo: customerInfo)
    }
}
