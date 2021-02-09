//
//  RealmFeedItems.swift
//  FeedStoreChallenge
//
//  Created by Marko Engelman on 09/02/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import RealmSwift

class RealmFeedItems: Object {
	var feed = List<RealmFeedImage>()
	@objc dynamic var timestamp = Date()
}
