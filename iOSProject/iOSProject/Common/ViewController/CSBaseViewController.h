//
//  CSBaseViewController.h
//  iOSProject
//
//  Created by changcai on 2018/8/23.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSNavigationBar.h"

@class CSBaseViewController;

@protocol CSBaseViewControllerDataSource <NSObject>

@optional

- (BOOL)baseViewControllerIsNeedNavBar:(CSBaseViewController *)baseViewController;

@end

@interface CSBaseViewController : UIViewController <CSNavigationBarDelegate,CSNavigationBarDataSource,CSBaseViewControllerDataSource>

/*默认的导航栏字体*/
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle;
/**  */
@property (weak, nonatomic) CSNavigationBar *navgationBar;

@end
