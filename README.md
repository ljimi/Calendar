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
<div>
@interface ViewController ()
/n
@property(nonatomic, strong) Calendar *calendar;
 <br>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.calendar.collection];
}



-(Calendar *)calendar{
    if (!_calendar) {
        _calendar = [Calendar new];
        _calendar.layout.itemSize = CGSizeMake(CELLW, CELLH);
        _calendar.collection = [[CalendarView alloc] initWithFrame: CGRectMake(0, 100, SCREENWIDTH, 0) collectionViewLayout:_calendar.layout];
        _calendar.collection.dataSource = self.calendar;//-------
        _calendar.collection.delegate = self.calendar;//-------
        [_calendar.collection setting];//设置
        [_calendar.collection setMonthDate];//加载数据
    }
    return _calendar;
}

@end
</div>
