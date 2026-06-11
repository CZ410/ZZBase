//
//  NSObject+KVO.swift
//  ZZBase
//
//  Created by Czz on 2023/1/4.
//

import Foundation

public extension NSObject {

    typealias ObserverBlockTargetAlias = (_ value: ZZObserveValue) -> Void

    struct ZZObserveValue {
        public var keyPath: String?
        public var object: Any?
        public var change: [NSKeyValueChangeKey: Any]?
        public var context: UnsafeMutableRawPointer?

        public init(keyPath: String?, object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            self.keyPath = keyPath
            self.object = object
            self.change = change
            self.context = context
        }

        public var newValue: Any? {
            return change?[NSKeyValueChangeKey.newKey]
        }

        public var oldValue: Any? {
            return change?[NSKeyValueChangeKey.oldKey]
        }
    }

    class ZZObserverBlockTarget: NSObject {

        struct TagBlock {
            var block: NSObject.ObserverBlockTargetAlias
            var key: String = ""
            init(key: String = "normal", block: @escaping NSObject.ObserverBlockTargetAlias) {
                self.key = key
                self.block = block
            }
        }

        deinit {
            targetDeinit?()
        }

        var targetDeinit: (() -> Void)?
        private var blocks: [TagBlock] = []

        public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            blocks.forEach {
                $0.block(ZZObserveValue(keyPath: keyPath, object: object, change: change, context: context))
            }
        }

        func upsert(block: TagBlock) {
            blocks.removeAll(where: { $0.key == block.key })
            blocks.append(block)
        }

        init(block: TagBlock) {
            super.init()
            blocks.append(block)
        }

        @discardableResult
        func removeBlock(for key: String) -> [TagBlock] {
            blocks.removeAll(where: { $0.key == key })
            return blocks
        }
    }

    private static var zzObserverTargetsAssociationKey: UInt8 = 0

    private var zz_observerTargetsAssociationPointer: UnsafeRawPointer {
        UnsafeRawPointer(&NSObject.zzObserverTargetsAssociationKey)
    }

    var zz_observerTargets: [String: NSObject.ZZObserverBlockTarget] {
        set {
            objc_setAssociatedObject(self, zz_observerTargetsAssociationPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            let obj = objc_getAssociatedObject(self, zz_observerTargetsAssociationPointer)
            return (obj as? [String: NSObject.ZZObserverBlockTarget]) ?? [:]
        }
    }

    func zz_addObservers(_ keyPaths: [String], key: String = "", options: NSKeyValueObservingOptions = [.old, .new], block: @escaping NSObject.ObserverBlockTargetAlias) {
        keyPaths.forEach { [weak self] keypath in
            guard let self = self else { return }
            self.zz_addObserver(keypath, key: key, options: options, block: block)
        }
    }

    func zz_addObserver(_ keyPath: String, key: String = "", options: NSKeyValueObservingOptions = [.old, .new], block: @escaping NSObject.ObserverBlockTargetAlias) {
        let tagblock = NSObject.ZZObserverBlockTarget.TagBlock(key: key, block: block)
        if let blockArr = zz_observerTargets[keyPath] {
            blockArr.upsert(block: tagblock)
        } else {
            let tag = NSObject.ZZObserverBlockTarget(block: tagblock)
            tag.targetDeinit = { [weak self] in
                self?.zz_removeObserver(keyPath)
            }
            zz_observerTargets[keyPath] = tag
            addObserver(tag, forKeyPath: keyPath, options: options, context: nil)
        }
    }

    func zz_removeObserver(_ keyPath: String, key: String) {
        guard let keyTargets = zz_observerTargets[keyPath] else { return }
        let blocks = keyTargets.removeBlock(for: key)
        if blocks.isEmpty {
            zz_removeObserver(keyPath)
        }
    }

    func zz_removeObservers(_ keyPaths: [String], key: String) {
        keyPaths.forEach { zz_removeObserver($0, key: key) }
    }

    func zz_removeObserver(_ keyPath: String) {
        guard let keyTargets = zz_observerTargets[keyPath] else { return }
        keyTargets.targetDeinit = nil
        removeObserver(keyTargets, forKeyPath: keyPath)
        zz_observerTargets.removeValue(forKey: keyPath)
    }

    func zz_removeAllObservers() {
        zz_observerTargets.forEach { keyPath, keyTargets in
            keyTargets.targetDeinit = nil
            removeObserver(keyTargets, forKeyPath: keyPath)
        }
        zz_observerTargets.removeAll()
    }

    func zz_remoAllObservers() {
        zz_removeAllObservers()
    }
}
