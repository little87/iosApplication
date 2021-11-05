//
//  detailViewController.h
//  Btest
//
//  Created by 林锋 on 2021/10/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface detailViewController : UIViewController

@property UILabel *Text;


- (instancetype)initWithText:(NSString *)text;
+ (instancetype)createNewOne:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
