//
//  RealmFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Marko Engelman on 09/02/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import RealmSwift

public final class RealmFeedStore: FeedStore {
	private let realm: Realm
	
	public init(configuration: Realm.Configuration) throws {
		realm = try Realm(configuration: configuration)
	}
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		let realmFeed = Self.map(feed: feed, timestamp: timestamp)
		let existingRealmFeed = realm.objects(RealmFeedItems.self)
		do {
			try realm.write {				
				realm.delete(existingRealmFeed)
				realm.add(realmFeed)
			}
			completion(.none)
		} catch {
			completion(error)
		}
	}
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		guard let realmFeed = realm.objects(RealmFeedItems.self).first else { return completion(.empty) }
		completion(.found(feed: realmFeed.feed.compactMap { Self.map(realmImage: $0) }, timestamp: realmFeed.timestamp))
	}
}

// MARK: - Private
private extension RealmFeedStore {
	static func map(feed: [LocalFeedImage], timestamp: Date) -> RealmFeedItems {
		let realmLocalFeed = RealmFeedItems()
		let items = feed.map { Self.map(image: $0) }
		realmLocalFeed.feed.append(objectsIn: items)
		realmLocalFeed.timestamp = timestamp
		return realmLocalFeed
	}
	
	static func map(image: LocalFeedImage) -> RealmFeedImage {
		return RealmFeedImage(
			id: image.id,
			description: image.description,
			location: image.location,
			url: image.url
		)
	}
	
	static func map(realmImage: RealmFeedImage) -> LocalFeedImage? {
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
