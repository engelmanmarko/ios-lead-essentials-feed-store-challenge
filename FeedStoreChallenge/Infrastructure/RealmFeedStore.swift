//
//  RealmFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Marko Engelman on 09/02/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public final class RealmFeedStore: FeedStore {
	public init() { }
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		
	}
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		completion(.empty)
	}
}
