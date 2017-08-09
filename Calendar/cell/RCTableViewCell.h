//
//  RCTableViewCell.h
//  ZhiChuangGC
//
//  Created by Mac on 17/4/19.
//  Copyright © 2017年 ZC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTableViewCell : UITableViewCell
@property(nonatomic, strong) UILabel *titleLab;
@property(nonatomic, strong) UILabel *lineLab;
@property(nonatomic, strong) UILabel *detailLab;
+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
