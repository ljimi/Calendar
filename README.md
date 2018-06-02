# Calendar

### 最近也用了好几个日历，那些都是在第三方上的扩展。就优化了一下这个日历。

<br>

----
 
### 一，功能介绍。

* 1 单月日历显示。
* 2 多月列表。
* 3 单月日历，点击日历head进入选择月份列表。

-----

### 二，修复bug。
* 1 线条闪动bug。
* 2 性能优化。
* 3 年月份稍有卡顿bug。

-----

### 三，集成简单。
* 看demo，只需一步。
 <br>
<div>
@interface ViewController ()
  <br>
@property(nonatomic, strong) Calendar *calendar;
  <br>
@end
  <br>
@implementation ViewController
  <br>
- (void)viewDidLoad {
  <br>
    [super viewDidLoad];
  <br>
    [self.view addSubview:self.calendar.collection];
  <br>
}
  <br>


-(Calendar *)calendar{
 <br>
    if (!_calendar) {
     <br>
        _calendar = [Calendar new];
         <br>
        _calendar.layout.itemSize = CGSizeMake(CELLW, CELLH);
         <br>
        _calendar.collection = [[CalendarView alloc] initWithFrame: CGRectMake(0, 100, SCREENWIDTH, 0) collectionViewLayout:_calendar.layout];
         <br>
        _calendar.collection.dataSource = self.calendar;//-------
         <br>
        _calendar.collection.delegate = self.calendar;//-------
         <br>
        [_calendar.collection setting];//设置
         <br>
        [_calendar.collection setMonthDate];//加载数据
         <br>
    }
     <br>
    return _calendar;
     <br>
}
 <br>

@end
 <br>
</div>

### 四，效果图。

![image](/sources/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202018-06-02%20at%2009.39.41.png)
![image](/sources/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202018-06-02%20at%2009.39.45.png)

<img src="/sources/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202018-06-02%20at%2009.39.45.png" width="50%" height="50%" />
