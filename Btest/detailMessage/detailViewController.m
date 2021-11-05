//
//  detailViewController.m
//  Btest
//
//  Created by 林锋 on 2021/10/28.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //不过不是它这儿 而是选中单元格那儿发送  找到 根控制器 目的控制器 id
}


- (instancetype)initWithText:(NSString *)text{
    //父类初始化
    if(self=[super init]){
        self.Text=[UILabel new];
        self.Text.text=text;
        self.Text.frame=CGRectMake(50, 100, 250, 200);
        self.Text.numberOfLines=0;
        self.Text.backgroundColor=[UIColor greenColor];
        [self.Text setTextColor:[UIColor blackColor]];
        [self.view addSubview:self.Text];
        self.view.backgroundColor=[UIColor whiteColor];
    }
    return self;
}


+ (instancetype)createNewOne:(NSString *)text{
    return  [[detailViewController alloc] initWithText:text];
}
@end
