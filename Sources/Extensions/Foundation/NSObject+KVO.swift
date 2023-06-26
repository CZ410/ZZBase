//
//  NSObject+Observer.swift
//  ZZBase
//
//  Created by Czz on 2023/1/4.
//

import Foundation

public extension NSObject{
    typealias ObserverBlockTargetAlias = (_ value: ZZObserveValue) -> ()

    struct ZZObserveValue {
        public var keyPath: String?
        public var object: Any?
        public var change: [NSKeyValueChangeKey : Any]?
        public var context: UnsafeMutableRawPointer?

        public init(keyPath: String?, object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
            self.keyPath = keyPath
            self.object = object
            self.change = change
            self.context = context
        }
        
        public var newValue: Any?{
            return change?[NSKeyValueChangeKey.newKey]
        }
        
        public var oldValue: Any?{
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
            self.targetDeinit?()
        }

        var targetDeinit: (() -> ())?
        private var blocks: [TagBlock] = []

        open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            self.blocks.forEach({
                $0.block(ZZObserveValue(keyPath: keyPath, object: object, change: change, context: context))
            })
        }

        func append(block: TagBlock){
            self.blocks.append(block)
        }

        init(block: TagBlock) {
            super.init()
            self.blocks.append(block)
        }

        @discardableResult
        func remoBlock(for key: String) -> [TagBlock]{
            self.blocks.removeAll(where: {$0.key == key})
            return self.blocks
        }
    }

    var zz_observerTargets: [String: NSObject.ZZObserverBlockTarget] {
        set{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "observerTargets".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "observerTargets".hashValue)
            let obj = objc_getAssociatedObject(self, key)
            return (obj as? [String: NSObject.ZZObserverBlockTarget]) ?? [:]
        }
    }
    
    func zz_addObservers(_ keyPaths:[String], key: String = "", options: NSKeyValueObservingOptions = [.old,.new], block:@escaping NSObject.ObserverBlockTargetAlias) {
        keyPaths.forEach {[weak self] (keypath) in
            guard let `self` = self else { return }
            self.zz_addObserver(keypath, key: key, options: options, block: block)
        }
    }

    func zz_addObserver(_ keyPath: String, key: String = "", options: NSKeyValueObservingOptions = [.old,.new], block:@escaping NSObject.ObserverBlockTargetAlias){
        if let blockArr = self.zz_observerTargets[keyPath] {
            let tagblock = NSObject.ZZObserverBlockTarget.TagBlock(key: key ,block: block)
            blockArr.append(block: tagblock)
        }else{
            let tagblock = NSObject.ZZObserverBlockTarget.TagBlock(key: key, block: block)
            let tag = NSObject.ZZObserverBlockTarget(block: tagblock)
            tag.targetDeinit = { [weak self] in
                self?.zz_removeObserver(keyPath)
            }
            self.zz_observerTargets[keyPath] = tag
            self.addObserver(tag, forKeyPath: keyPath, options: options, context: nil)
        }
    }

    func zz_removeObserver(_ keyPath: String, key: String){
        guard let keyTargets = self.zz_observerTargets[keyPath] else { return }
        let blocks = keyTargets.remoBlock(for: key)
        if blocks.count <= 0 {
            self.zz_removeObserver(keyPath)
        }
    }

    func zz_removeObservers(_ keyPaths: [String], key: String){
        keyPaths.forEach({self.zz_removeObserver($0, key: key)})
    }

    func zz_removeObserver(_ keyPath: String){
        guard let keyTargets = self.zz_observerTargets[keyPath] else { return }
        self.removeObserver(keyTargets, forKeyPath: keyPath)
        self.zz_observerTargets.removeValue(forKey: keyPath)
    }

    func zz_remoAllObservers(){
        self.zz_observerTargets.forEach { (keyPath, keyTargets) in
            self.removeObserver(keyTargets, forKeyPath: keyPath)
        }
        self.zz_observerTargets.removeAll()
    }
}
