//
//  sendViewController.m
//  Btest
//
//  Created by 林锋 on 2021/10/28.
//

#import "sendViewController.h"

@interface sendViewController ()


@end

@implementation sendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"准备发送新消息了");
}


- (IBAction)dismissView:(id)sender {
    
    //在编辑界面 取消视图
    [self dismissViewControllerAnimated:YES completion:^(){
        NSLog(@"不再发送了");
    }];
}
@end
