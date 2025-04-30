//
//  PurchasesManager+Trial.swift
//  LBPurchases
//
//  Created by Luis Alvarez on 4/28/25.
//

import LBFoundation
import RevenueCat
import SwiftUI

/**
 Trial logic
 */
public extension PurchasesManager {
    
    public func hasTrialAvailable() async -> Bool {
        guard !__STATIC else { return subscriptionState.hasTrial }
        guard let product = try? await Purchases.shared.offerings().current?.availablePackages.first?.storeProduct else { return false }
         let trialStatus = await Purchases.shared.checkTrialOrIntroDiscountEligibility(product: product)
        return trialStatus == .eligible
    }
}
