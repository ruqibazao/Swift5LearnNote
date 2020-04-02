//
//  ViewController.swift
//  Swift5LearnNote
//
//  Created by nenhall on 2020/3/2.
//  Copyright © 2020 nenhall. All rights reserved.
//



import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        ifelse()

//        enumFunc()
        
//        optionalFunc()
        
//        blockFunc()
        
//        pointerFunc()
        
//        stringFunc()
        
//        asyncFunc()
        
        funcFunc()
        
    }
    
    /// 流程控制
    func ifelse() {

        /**
         * if 后面的条件只能是bool类型
         * 从swift3开始取消自增自减动算
         */
        var num = 5
        while num > 0 {
            num -= 1
            print("num is \(num)")
        }
        
        // 相当于c 语言的 do-while
        repeat {
            num -= 1
            print("num is \(num)")
        } while num > 0
        
        
//        区间动算符
        for i in 0...3 { }
        let names = ["a","b","c","d"]
        
        let range = 1...3
        range.contains(5) //是否包含5
        for i in range {
//            默认里面是不能修改i 的，要想修改i ，需要改成：
//            for var i in range { }
        }
        
        // 单侧区间：让区间朝一个方向尽可能的远
        for name in names[2...] {} // 上述是：从第二个下标土开始，一直增涨到数组的最大下标
        for name in names[...2] {} //从0到2
        for name in names[..<2] {} //从0到小于2

        // 区间类型
        // 合闭动算符
        let range1: ClosedRange<Int> = 1...3
        // 半开区间动算符
        let range2: Range<Int> = 1..<3
        // 单侧区间动算符
        let range3: PartialRangeThrough<Int> = ...5

        // 字符、字符串也能使用区间动算符，但默认不能用在 for-in 中
//        for char in "A"..."D" { }
        
        // switch 必须要保证级处理所有情况
        // case、default 后面至少要有一条语句
        // 如果不想做任何事情，加个 break即可
        // 如果所情况都能处理，那可以不用写 default
        switch num {
        case 1:
            print("");
        default:
            break
        }
        
        // 复合条件：switch 也支持character 、 string 类型的
        let string = "Jack"
        switch string {
        case "Jack":
            print()
            // fallthrough 是灌穿，也就是还会往下一个case执行，默认是不会执行下一个case的
            fallthrough
        case "Jick":
            print()
        default:
            break
        }
        
        // 元组匹配
        let point = (1, 1)
        switch point {
        case (0,0): print()
        case (1,1): print()
        case (let x,var y): print(x, y)
            // where x == y 只有这个条件成立才会进入对应的case
        case (let x,var y) where x == y: print(x, y)
        default:
            break
        }
        
        // 使用where 来过滤 num，只有where条件成立的时候才会进入括号内，否则就执行下一次循环
        for n in [-10, 10, 20] where n > 0 { }
        
        // 标签语句
        // outer 代表外层for 循环
        outer: for k in 1...4 {
            for l in 1...4 {
                if k == 3 {
                    continue outer
                }
                
                if k == 4 {
                    print(l)
                    break outer
                }
            }
          }
        
        /// Description1
        /// - Parameters:
        ///   - v1: v1 description
        ///   - v2: v2 description
        /// - Note: xxxx
        func sum(v1: Int, v2: Int) -> (Int) {
            // 隐式返回：。。。
            1 + 2
        }
        // 参数名省略
        // func sum2(_ : Int, v2 time : Int) -> () {}
        
        // C++加默认值，但必须依资助从最右开始往左设，且中间不能跳过
        // 但swift可以不必这样做，因为swift有参数标签，但前提是参数标签没有省略
        // func sum2(_ : Int, v2 time : Int = 10) -> () {}
        
        /** 可变参数： `...` 代替
         * 一个函数最多只能有一个可变参数
         * 紧跟在可变参数后面的参数不能省略标签
         * 如下，如果 string 标签也首略，刚好第一个参数是个数组，将无法分清传递的参数是那个的，
         * `inout`： 输入输出参数，如果要在函数内部修改，则需要加入 inout，但如果是可变参数，则不能加inout
         * 传参的时候使用 & 符号，如：test([1], &num, "")
         * inout 的本质是地址传递
         * inout 参数不能有默认值
         * inout 参数只能传入可以被`多次赋值的`,也就是说一定是变量
         */
        /**      inout的本质总结
         * 如果实参有物理内存地址，且没有设置属性观察器 p直接将实参的内存地址传入函数(实参进行引用传递)
         * 如果实参是计算属性 或者 设置了属性观察器
         * 采取了Copy In Copy Out的做法
         * 调用该函数时，先复制实参的值，产生副本【get】
         * 将副本的内存地址传入函数(副本进行引用传递)，在函数内部可以修改副本的值 ü 函数返回后，再将副本的值覆盖实参的值【set】
         * 总结:inout的本质就是引用传递(地址传递)
         */
        func test(_ numbers: Any..., string: inout String, _ other: String) {
            
        }
        
        /**
         内联函数：自将函数调用展开为函数体，这样就能减少开辟栈空间
         * swift 下，debug 模式默认是开启关闭了内联函数优的，release 模式下默认是开启了的
         * 如下几种情况不会进行内联，是正常的函数调用：
            * 如果函数体比较长，则不会内联
            * 函数内包含递归调用
            * 函数内包含动态派发(绑定)：如B继承A，用A创建的实例对象，中途可以让其指向B创建的实例对象
         * @inline
         * @inline(never)：永远不会被内联，即使开启了编译器优化
         * @inline(__always)：开启编译器优化后，即使代码很长，也会被内联（递归调用、动态派发的函数除外）
         */
        @inline(never) func test(){}

        /**
         函数类型作为参数
         定义一个变量函数
         */
        var fn: (Int, Int) -> Int = sum(v1:v2:)
        // 调用时不需要参数标签
        fn(2,3)
        
        var fn2: (Int) -> Int

        // 返回值是一个函数：`(Int) -> (Int)`
        // 返回值是函数类型的函数，叫高阶函数
        func forward( _ forward: Bool) -> (Int) -> (Int) {
            return  fn2
        }
        
        /**
         函数别名：typealias
         */
        typealias Byte = Int8
        
        // 给元组取别名
        // 按swift 标准库的定义，Void就是一个空元组
        // public typealias Void = ()
        typealias Date = (year: Int, month: Int, day: Int)
        func test2(_ date: Date) {
            print(date.day,date.year)
        }
        
        /**
         * 函数重载：
         * 规则：
            * 函数名相同
            * 参数个数不同 ｜｜ 参数类型不同 ｜｜ 参数标签不同
         * 注意点
            * 返回值类型与函数重载无关，并编调用的时候会报错
            * 默认参数值和函数重载一起使用产生二义性时，编译器不会报错
            * 可变参数、省略参数标签、函娄重载一起使用产生二义性时，编译器有可能会报错
         */
    }
    
    /// 枚举可选项
    func enumFunc() {
        enum Direction {
            case north
            case south
            case east
            case west
        }
        
        enum Score {
            // 关联值
            case points(Int)
            case grade(Character)
        }
        
        enum Date {
            case digit(year: Int, month: Int, day: Int)
            case string(String)
        }
        
        /**
         枚举成员可以使用相同类型的默认值预先关联，这个默认值叫做：原始值
         */
        enum Direction2: Character {
            case north = "a"
            case south = "b"
            case east = "c"
            case west = "d"
        }
        // 访问原始值
        Direction2(rawValue: "a") //初始化方法，如果传的rawValue超出范围，则初始化失败
        print(Direction2.north.rawValue)
        
        
        /**
         switch Score {
         case let .points(i):
             print(i)
         case let .grade(i):
             print(i)
         }
         
         switch Date {
         case .digit(let year, let month, var day):
         // let 写在前面，那后面的所有都是 let 类型
         case let .string(value)
         }
         */
        

        /**
         递归枚举:在枚举前面加 indirect 修饰词
         下面两种写法等价的
         indirect enum Date2 {
             case digit(year: Int, month: Int, day: Int)
             case string(String)
             case data(d: Date2)
         }
         enum Date2 {
             case digit(year: Int, month: Int, day: Int)
             case string(String)
             indirect case data(d: Date2)
         }
         */
        
        MemoryLayout<Int>.size // 实际用到的空间大小
        MemoryLayout<Int>.stride // 分配的空间大小
        MemoryLayout<Int>.alignment // 内存对齐参数，一般以8的倍数对齐，但在Mac iOS中通过 malloc 函数分配的内存大小总是16的倍数
//        class_getInstanceSize(Date.self)
//        class_getInstanceSize(type(of: Date))

    }
    
    func optionalFunc()  {
        /**
         * 可选项：
         * 1. 它允许将值设置为 nil
         * 2. 在类型名称后面加个？号，来定义一个可选项
         * 可选项的本质是一个盒子，里面包装的某种类型，所以要使用的时候需要强制解包 age!
         * 但如果是空盒子时，强制解包程序会崩溃
         */
        let age: Int? = 10
        if age != nil {
            print(age!)
        }
        
        // 可选项绑定，如果 age？ 有值就会赋给 number ,否则就走else
        if let number = age {
            print("可选项 age 不为空:", number)
        } else {
            print("可选项 age 为空")
        }
        
        // ?? 空合动算符
        let a: Int = 1
        let b: Int? = 2
        // 如果 a 和 b 都是可选，则C也是可选项，如果b不是可选项，则返回类型非可选项
        // 所以返回是否为可选项取决于空合运算符最右的那个对象
        let c = a ?? b
        
        /**
         * 当 guard 语句的条件为false时，会执行大括号里面的代码，成立则跳过王guard语句
         * guard 语句特别适合用来“提前退出”
         guard 条件 else {
             退出当前作用域
         }
         */
        
        func login(_ info: [String : String]) {
            guard let userName = info["userName"] else {
                print("请输入用户名")
                return
            }
            
            guard let password = info["password"] else {
                print("请输入密码")
                return
            }
        
            print(userName, password)
        }
        
//        lldb: frame v -R age 查看变量/对象结构
        
    }
    
    
    /// 结构体与类
    func structAndClassFunc()  {
        
        /**
         * 被 class 修饰的类型方法、下标，允许被子类重写
         * 被 static 修饰的类型方法、下标，不允许被子类重写
         * class 不能用来修饰存储属性
         *
         * 被final修饰的方法、下标、属性是禁止被重写的
         * 被final修饰的类，禁止被继承的
         *
         * 结构体调用方法在编译期间就确定了，但类需要在运行时才能确定，因为类存在继承
         */
        
        /**
         * 结构体、枚举是值类型，类是引用类型
         * 编译器并没有为类自动生成可传入成员值的初始化器
         * 如何类的所有成员都在定义的时候指定了初始化值，编译器会为类生成无参的初始化器
         */
        
        // 在swift 标准库中，为了提升性能，string array dictionary set 采用了 Copy on write 技术
        
        /**
         引用类型赋值：
         引用类型赋值给 var let 或者给函数传参，是将内存地址拷贝一份
         */
    }
    
    /// 闭包(Closure)的本质
    func blockFunc() {
//        定义： 一个函数和它所捕获的变量\常量环境组合起来 ，称为闭包
//        格式：
        func fnnn() -> () -> () {
            func fn1(){
            }
            return fn1
        }
        
       var fn = {
            /**
             （参数列表）-> 返回值类型 in
             函数体代码
             */
            (v1: Int, v2: Int) -> Int in
        print("...")
            return v1 + v2
        }
        
        fn(10, 10)
        
        func exec(v1: Int, v2: Int, fn2: (Int, Int) -> Int) {
            //...
            fn2(50, 50)
            print("")
        }
       
        // $0 代表闭包的第一个参数，$1代表第二个，以此类推
       exec(v1: 20, v2: 10, fn2: {$0 + $1})
       exec(v1: 40, v2: 10, fn2: fn)
        
        // 尾随闭包：一个被书写在函数调用括号外面(后面)的闭包表达式，但前提是闭包表达式是作为函数的最后一个实参
        exec(v1: 20, v2: 20) {
            $0 + $1
        }

        func exec2( fn2: (Int, Int) -> Int) {
            //...
        }
        
        // 如果闭包表达式是唯一实参，而且使用了尾随闭包，那可以用以下简写方法：下面三种调用方法是等价的
        exec2(fn2: {$0 + $1}) // 原始写法
        exec2() {$0 + $1} // 简写
        exec2{ $0 + $1 } // 简写
        
        
        // 自动闭包
        func getFirstPositive(_ v1: Int, _ v2: @autoclosure () -> Int) -> Int {
            return v1 > 0 ? v1 : v2()
        }
        // @autoclosure 自动把 20包装成：getFirstPositive(10, {20})
        getFirstPositive(10, 20)
        
    }

    func propertyFunc() {
        /**
         * 属性：
         * 存储属性：
         *  * 类似于成员变量这个概念
         *  * 存储在实例的内存中
         *  * 结构体和类可以定义存储属性，枚举不可以
         *  * 在inout里面，如果传的是存储属性，inout 函数里面是直接引用了内存地址

         * 计算属性：
         *  * 只能用var 修饰，不能用let，因为计算属性是可能发生变化的
         *  * 只读计算属性：只有get，没有set方法
         *  * 计算属性本身没有地址值
         *  * 在inout里面，如果传的是计算属性，inout 函数里面是先调get方法得到值，然后使用值，最后调用set方法

         * 类型属性
         * 1. 实例属性：
         *  a. 存储实例属性：存储在实例的内存中，每个实例都有1份
         *  b. 计算实例属性
         * 2. 存储类型属性：整个程序运行过程中，就只有1份内存
         * 3. 计算类型属性：
         *
         * 可以通过static 定义类型属性：`static var count: Int` ，如果是类，也可以用关键字class
         * 类型属性不同于存储实例属性，必须给存储类型属性设定初始值，而且它的线程是安全的
         *
         * 子类可以将父类的存储属性重写为计算属性，但子类不能讲父类属性重写为存储属性
         */
        
        class car {
            // 存储属性
            var type = 1
            let type2 = 1

            // 计算属性
            var speed: Int {
                set(newSpeed) {
                    print(newSpeed)
                }
                get {
                    return 20
                }
            }
            // 计算属性
            var speed2: Int {
                return 20
            }
            
            // lazy
            // 1.lazy属性必须是var,不能是let
            // 2.如果多条线程同时第一次访问lazy属性，无法保证属性只被初化一次的
            // 3.当结构休包含一个延迟存储属性时，只有var才能访问延迟存储属性
            lazy var image: UIImage = {
                // 也就是多条线程同时访问的话，这个括号内可能会被执行多次
                return UIImage.init()
            }()
            
            // 属性观察器
            // 可以为非lazy 的var 存储属性设置属性观察器
            var name: String = "。。。" {
                willSet {
                    
                }
                didSet {
                    
                }
            }
            
            
        }
        
        var cr = car.init()
        cr.speed = 30
        cr.type = 1
        
    }
    
    func  methodFunc() {
        
        
    }
    
    /**
     * 下标
     * subscript 可以没有set方法，但必须要有get方法
     */
    func subscriptFunc() {
        class Point {
            var x = 0.0, y = 0.0
            // 没有添加形参的时候，访问的时候可以直接使用下标访问
//            subscript(index i: Int) -> Double {
            subscript(index: Int) -> Double {
                set {
                    if index == 0 {
                       x = newValue
                    }
                    else {
                       y = newValue
                    }
                }
                get {
                    if index == 0 {
                       return x
                    }
                    else {
                       return y
                    }
                }
            }
            
        }
        
        let p = Point()
        p[0] = 10.0
        p[1] = 20.0
        
        
        /**
         * swift 的多态实现原理 （OC：runtime，C++：虚表(虚函数表)）
         * 多态：父类类型指向子类对象
         * swift原理：直接将对象将来要调用的函数地址存在类的内存信息哪里，类的内存信息是编译完就可以确定的
         * 结构体调用方法是确定的，因为它不存在继承重写；
         * 类调用方法是不确定人，还得看指向的类是谁
         */
        
    }
    
    func initializeFunc()  {
        /**
         * 初始化器：swift 使用了两段式初始化方式，
         *  * 第一阶段：初始化所有存储属性，在第一阶段初始化完成前，不能调用任何实例方法，不能读取任何属性的值，也不能引用self
         *  * 第二阶段：设置新值
         * 1. 指定初始化器:（designated）每个类至少有一个指定初始化器，指定初始化器也是主要初始化器
         *  * 指定初始化器必须先调用父类初始化器，然后才能为继承的属性设置新值
         * 2. 便捷初始化器:（convenience）
         *  * 便捷初始化器必须先调用同类中的其它初始化器，然后才能再为任意属性设置新值
         *
         *
         */
        
        class Size {
            var width = 0
            var height = 0
            convenience init(width: Int) {
                // 便捷初始化器里面必须调用一个指定初始化器，而且必须放在最前面
                self.init()
                
                self.width = 10
                self.height = 20
            }
            
        }
        
        class subSize : Size{
            var positon = 100
           convenience init(width: Int) {
               
            self.init(positon: 100)
            }
            init(positon: Int) {
                
                
            }
            
        }
        
        
    }


    func accessControl() {
        /** 访问控制权限
         * open: 允许在定义实体的模块、其他模块中访问，允许其他模块进行继承、重写(open只能用在类、类成员上)
         * public: 允许在定义实体的模块、其他模块中访问，不允许其他模块进行继承、重写
         * internal: 只允许在定义实体的模块中访问，不允许在其他模块中访，绝大部分实体默认都是 internal 级别
         * fileprivate: 只允许在定义实体的源文件中访问
         * private: 只允许在定义实体的封闭声明中访问,也就是在定义的大括号内访问
         */
    }
    
    /// 内存管理
    func memorymanager() {
        /**
         swift 的 ARC 中有三种引用
         * 强引用： strong reference
            * 默认情况下，引用都是强引用
         * 弱引用： weak reference
            * 必须是可选类型 var ，因为实例销毁后，ARC会自动将弱引用设置为 nil
            * ARC 自动给已弱用引设置 nil时，不会触发属性观察器
         * 无主引用： unowned reference
            * 不会产生强引用，实例销毁后仍然存储着实例的内存地址（类似OC中的unsafe_unrtained）
            * 试图在实例销毁后访问无主引用，会产生运行时错误(野指针)
         
         * Note:
            * weak、unowned 都能解决循环引用的问题，unowned要比weak少一些性能消耗
            * 在生命周期中可能会变为 nil 的使用 weak
            * 初始化赋值后再也不会变 nil 的使用 unowned
            * 如果想在定义的闭包属性的同时引用self ，这个闭包必须是lazy的（因为在实例初始化完毕之后才能引用self）
            * 如果lazy属性是闭包调用的结果，那么不用考虑循环引用的问题（因为闭包调用后，闭包的生命周期就结束了）,如如下 Person2 代码 否则如如下 Person1 代码必须使用weak修饰
         */
        
        class Person1 {
            var age:Int = 0
            // 必须使用weak修饰，否则循环引用
            lazy var fn: (() -> ()) = {
                [weak self] in
                self?.run()
            }
            func run()  { }
        }
        
        class Person2 {
            var age:Int = 0
            // 如果lazy属性是闭包调用的结果，那么不用考虑循环引用的问题（因为闭包调用后，闭包的生命周期就结束了）
            lazy var getAge: Int = {
                self.age
            }()
        }
        
        
        /**
         闭包：
         * 非逃逸闭包：闭包调用发生在函数结束前，闭包调用在函数作用域内
         * 逃逸闭包： 闭包有可能函数结束后调用，闭包调用逃离了函数作用域，需要通过`@escaping`声明
         */
        
    }
    
    
    // 方法过期提示 renamed：新方法的名字
    @available(iOS, deprecated: 10, renamed: "newName")
    /// 指针
    func pointerFunc()  {
        /**
         * UnsafePointer<Pointee> 类似于 const Pointee *
         * UnsafeMutablePointer<Pointee> 类似于 Pointee *
         * UnsafeRawPointer 类似于 const void *
         * UnsafeMutableRawPointer 类似于 void *
         */
        
        
        var age = 10
        func test1(_ ptr: UnsafeMutablePointer<Int>) {
            ptr.pointee = 20
            print("test2:",ptr.pointee)

        }
        
        func test2(_ ptr: UnsafePointer<Int>) {
            print("test2:",ptr.pointee)
        }
        
        func test3(_ ptr: UnsafeRawPointer) {
            // 取出数据，你的数据是什么类型，就传什么，如age是Int类型，所以传Int.self
            print("test3:",ptr.load(as: Int.self))
        }
        
        func test4(_ ptr: UnsafeMutableRawPointer) {
            // 存一个Int 类型数据，30存入age，
            ptr.storeBytes(of: 30, as: Int.self)
        }
        
        test1(&age)
        test2(&age)
        test3(&age)
        test4(&age)
        print("age:",age)
        
        let arr = NSArray(array: [10,20,30,40,50])
        arr.enumerateObjects { (obj, idx, stop) in
            if idx == 2 {
                stop.pointee = true
            }
            print(idx,obj)
        }
        // swift版
        for (idx, obj) in arr.enumerated() {
            print(idx, obj)
        }
        
        // 获取某变量的指针
        var age2 = 20
//        var ptr = withUnsafePointer(to: &age2) { (p) -> Int in
//            // p 其实就是指向age2的指针
//            return 20
//        }
        var ptr = withUnsafePointer(to: &age2) { (p) -> UnsafePointer<Int> in
                   // p 其实就是指向age2的指针
                   return p
        }
        // 下面写法等价上面的写法，因为里面的闭包表达式的返加回值就是当时传入的第一个参数，所以用`$0`，即第一个参数
        var ptr2 = withUnsafePointer(to: &age2) { $0 }

        print("ptr.pointee:",ptr.pointee)
        // 获取一个 UnsafeRawPointer 指针
        var ptr3 = withUnsafePointer(to: &age2, { UnsafeRawPointer($0) })
        // 获取一个 UnsafeMutableRawPointer 指外地
        var ptr4 = withUnsafeMutablePointer(to: &age2, { UnsafeMutableRawPointer($0)})

        #if TEST
        print("test")
        #elseif OTHER
        print("other")
        #else

        #endif
        // ios 10 ,macOS 12.15及以上才可以用，* 号代表其它平台没限制
        if #available(iOS 10, macOS 12.15, *) {
            #warning("todo")
        // TODO: xxxxxxx
            // FIXME: fix me
            
            fatalError("fatalError")
        }
        // 重命名oc函数名
//        @_silgen_name("ocFunc") func newFuncName(a: Int32, b: Int32)
        
//        do {
//            try 1
//        } catch {
//            switch error {
//            case 1: break
//            default:
//                break
//            }
//        }
        
        /**
         Swift类 继承自NSObject后对象的内存结构会有所变化：
         没有继承的时候：最前的8个字节是用来存在metadata的，再后8个字节用来存放引用计数相关的
         继续的时候：最前面的8个字节是isa，后面的是对象信息相关的，最后可能可能会为了内存对齐多出8个字节
         */
        
    }
    
    func stringFunc() {
        var str = "123_"
        
        print(str.startIndex,str.endIndex,str.count)
        
        str.insert("c", at: str.startIndex)
        print(str)
        print(str.prefix(2),str.suffix(2))
        let range = str.startIndex..<str.index(before: str.endIndex)
        // 在 substring没有发生改变前，它内部是指向 str 的同一块内存的，如发生append或修改后会新建一块内存来存放
        var substring = str[range]
        
        print("range:",substring,str)
        
//        str.append("666")
        substring.append(contentsOf: "666")
        print("range:",substring,str)
        
        let str2 = """
                fff
fff
fff
    ddd
"""
        
        print(str2)

    }
    
    func kvckvoFunc()  {
        /**
        Swift 支持kvc kvo 的条件：
        属性所在的类，监听器最终继承自NSObject
        用 @objc dynamic 修饰对应的属性
         因为kvc kvo是基于runtime 实现的，所以必须加上以上修饰词
         */
        
    }
    
    func asyncFunc() {

        let item = DispatchWorkItem {
            for i in 1..<100 {
                print(i)
            }
        }
       
        
        item.notify(queue: DispatchQueue.main) {
            print("done")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.2) {
            
        }
        
        // 同时允许3个线程访问
        let lock = DispatchSemaphore(value: 3)
        lock.wait()
        lock.signal()
        
        let lock2 = NSLock()
        lock2.lock()
        lock2.unlock()
        
        // 递归锁
        let lock3 = NSRecursiveLock();
        lock3.lock()
        lock3.unlock()
        
        
        var arr = [1, 2, 3, 4]
        var arr2 = arr.map {i in
            return i
        }
        print(arr2)
        // map:你传过来什么我就返回什么给你，个数就是数组的个数
        var arr22 = arr.map { "abc_\($0)" }
        print(arr22)

        arr2 = arr.filter({ i in
            if i % 2 == 0 {
                return true
            }
            return false
        })
        print(arr2)
        
        // 第一个参数：返回值
        // 第二个参数：(第一次调用时的值(上一次调用的结果), 数组元素)
        var arr3 = arr.reduce(10) {
            (result, element) -> Int in
            print(result,element)
            return result + element
        }
        
        print(arr3)
        
        var arr4 = arr.flatMap { Array.init(repeating: $0, count: $0)}
        print(arr4)
        
        print(arr.compactMap{ Int($0)})
        
        var lazyArr = arr.lazy.map {$0 * 2}
        print(lazyArr[0])
        
        
        var fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        var str: String = "2011-09-10"
        var date = fmt.date(from: str)
        print(date,date.flatMap{$0})
        
        var obj = arr.firstIndex{$0 == 2}
        print("obj:",obj)
        
        struct Person {
            var name: String
            var age: Int
            
            init?(_ json: [String : Any]) {
                    //  同时成立才算成立，以 逗号隔开，等阶于 &&
                guard let name = json["name"] as? String,
                      let age = json["age"] as? Int else {
                        return nil
                }
                
                self.name = name
                self.age = age
            }
        }
    }

    func funcFunc() {
        func add(_ v: Int) -> (Int) -> Int {
            return {
                $0 + v
            }
        }
        let num = add(3)
        print(num(3))
    }
    
}

// 条件编译
// 平台
#if os(macOS) || os(iOS)
// 架构
#elseif arch(x86_64) || arch(arm64)
// swift 版本
#elseif swift(<5) && swift(>=3)
// 模拟器
#elseif targetEnvironment(simulator)
// 可以导入某模块
#elseif canImport(Foundation)
#else
#endif



func hasPrefix(_ prefix: String) -> ((String) -> Bool) {
    { $0.hasPrefix(prefix) }
    //        return {
    //            (str: String) -> Bool in
    //            str.hasPrefix(prefix)
    //        }
}

var fn = hasPrefix("123")
//print(fn("123"))


/// 字面量/字面量协议
/// 遵守对应的协议： ExpressibleByBooleanLiteral，因为这里是想使用Bool类型初始化，所以遵守：`ExpressibleByBooleanLiteral`协议
extension Int : ExpressibleByBooleanLiteral {
    // 实现协议对应的初始化方法
    public  init(booleanLiteral value: Bool) {
        self = value ? 1 : 0
    }
}


func expressibleFunc() {
 
    var num: Int = true
    // MARK: - 123
    
}




  protocol TestProtocol {
    associatedtype Num
     var testVar: Int { get set}  //可选
    //协议中的变量需要指定 get set
      func testFunc() //可选
    func noOptionFunc()  //不可选
    
}

 extension TestProtocol {
     func noOptionFunc() {
        
    }
    func testFunc() {
        
    }
    var testVar: Int {
        get {
            return 0
        }
        set {
            
        }
    }
}

class aaaa: TestProtocol {
    typealias Num = Int
    var testVar: Int = 10
}

class Person {
    required init() {
        
    }
    
    init(age: Int) {
        
    }
}

class Student: Person {
    init(no: Int) {
        super.init()
    }
    
    required init() {
        super.init()
    }
    override init(age: Int) {
        super.init()
    }
}


