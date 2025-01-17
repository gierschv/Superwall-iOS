//
//  File.swift
//  
//
//  Created by Yusuf Tör on 07/09/2022.
//

import Foundation

/// Contains the possible reasons for the dismissal of a paywall.
public enum DismissState: Equatable, Sendable {
  /// The paywall was dismissed because the user purchased a product
  ///
  /// - Parameters:
  ///   - productId: The identifier of the product.
  case purchased(productId: String)

  /// The paywall was dismissed by the user manually pressing the close button.
  case closed

  /// The paywall was dismissed due to the user restoring their purchases.
  case restored
}

/// Objective-C compatible enum for ``DismissState``
@objc(SWKDismissState)
public enum DismissStateObjc: Int, Sendable {
  case purchased
  case closed
  case restored
}

/// The current state of a paywall.
public enum PaywallState {
  /// The paywall was presented. Contains a ``PaywallInfo`` object with more information about the presented paywall.
  case presented(PaywallInfo)

  /// The paywall was dismissed. Contains a ``PaywallDismissedResult`` object that contains information about the
  /// paywall and why it was dismissed.
  case dismissed(PaywallInfo, DismissState)

  /// The paywall was skipped. Contains a ``PaywallSkippedReason`` enum whose cases state why the paywall was skipped.
  case skipped(PaywallSkippedReason)
}
