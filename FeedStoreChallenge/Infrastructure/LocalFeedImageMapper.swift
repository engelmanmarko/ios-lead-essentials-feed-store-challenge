//
//  LocalFeedImageMapper.swift
//  FeedStoreChallenge
//
//  Created by Marko Engelman on 09/02/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

internal final class LocalFeedImageMapper {
	internal static func map(feed: [LocalFeedImage], timestamp: Date) -> RealmFeedItems {
		let realmLocalFeed = RealmFeedItems()
		let items = feed.map { Self.map(image: $0) }
		realmLocalFeed.feed.append(objectsIn: items)
		realmLocalFeed.timestamp = timestamp
		return realmLocalFeed
	}
	
	internal static func map(image: LocalFeedImage) -> RealmFeedImage {
		return RealmFeedImage(
			id: image.id,
			description: image.description,
			location: image.location,
			url: image.url
		)
	}
	
	internal static func map(realmImage: RealmFeedImage) -> LocalFeedImage? {
		guard
			let id = UUID(uuidString: realmImage.id),
			let url = URL(string: realmImage.url)
		else {
			return nil
		}
		
		return LocalFeedImage(
			id: id,
			description: realmImage.imageDescription,
			location: realmImage.location,
			url: url
		)
	}
}
