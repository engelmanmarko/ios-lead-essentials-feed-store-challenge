//
//  RealmFeedImage.swift
//  FeedStoreChallenge
//
//  Created by Marko Engelman on 09/02/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import RealmSwift

class RealmFeedImage: Object {
	@objc dynamic var id = ""
	@objc dynamic var imageDescription: String? = nil
	@objc dynamic var location: String? = nil
	@objc dynamic var url = ""

	convenience init(id: UUID, description: String?, location: String?, url: URL) {
		self.init()
		self.id = id.uuidString
		self.imageDescription = description
		self.location = location
		self.url = url.absoluteString
	}
	
	override class func primaryKey() -> String? {
		"id"
	}
}
