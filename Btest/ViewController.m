//
//  ViewController.m
//  Btest
//
//  Created by 林锋 on 2021/10/25.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "detailViewController.h"
#import "bottomViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate,UISearchControllerDelegate>
//用来保存属性的
@property UIBarButtonItem * bt;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    //放置一个searchBar到navigationBar里
    self.navigationItem.searchController=[UISearchController new];
    //设置搜索框的代理
    self.navigationItem.searchController.searchBar.delegate=self;
    //设置searchController的代理
    self.navigationItem.searchController.delegate=self;
    
    self.navigationItem.searchController.view.backgroundColor=[UIColor whiteColor];
    
    //navigationItem的底部
    //创建readAll按钮
    UIBarButtonItem *readAll=[[UIBarButtonItem alloc] initWithTitle:@"Read All" style:UIBarButtonItemStylePlain target:self action:@selector(readall)];
 
    UIBarButtonItem *flexible=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:NULL];
    UIBarButtonItem *delete=[[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteall)];
    
    //设置-----用的是self 不是self.navigationController
    [self setToolbarItems:@[readAll,flexible,delete] animated:YES];
    
    
    //创建menu
    //创建menuController
    UIAction *action1=[UIAction actionWithTitle:@"Select Message" image:[UIImage systemImageNamed:@"checkmark.circle"] identifier:NULL handler:^(UIAction *act1){
        //实现全选的功能
        [self chooseAll];
        //改编编辑按钮的状态
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancelAll)];
        //弹出readALl delete
        [self pushNewOne];
            }];
    UIAction *action2=[UIAction actionWithTitle:@"Edit Pins" image:[UIImage systemImageNamed:@"pin"] identifier:NULL handler:^(UIAction *act2){}];
    UIAction *action3=[UIAction actionWithTitle:@"Edit Name and Photo" image:[UIImage systemImageNamed:@"person.crop.circle"] identifier:NULL handler:^(UIAction *act3){}];
    
    UIMenu *menu=[UIMenu menuWithChildren:@[action1,action2,action3]];

    
    //保存一下当前的item
    self.bt=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit menu:menu];
    //添加editButtonItem
    self.navigationItem.leftBarButtonItem=self.bt;

    //行高
    self.tableView.rowHeight=80;
     
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //xib
//   NSArray *array=[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
//
//    TableViewCell *cell=[array lastObject];
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"message"];
   
    

  
   // cell.imageView.image=[UIImage systemImageNamed:@"person.circle.fill"];
    //图片的设置大些
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"person.circle.fill"]];
    img.frame=CGRectMake(20, 15, 50, 50);
    
    UILabel *text1=[UILabel new];
    text1.text=@"1382083282789";
    text1.frame=CGRectMake(75, 10, 200, 20);
    
    UILabel *text2=[UILabel new];
    text2.text=@"11:48";
    text2.frame=CGRectMake(414-30-50, 10, 50, 20);
    
    UIImageView *img2=[[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"chevron.right"]];
    img2.frame=CGRectMake(414-30, 13, 13, 13);
    [img2 setTintColor:[UIColor grayColor]];
    
    UILabel *text3=[UILabel new];
    text3.text=@"我都是哈哈疯狂大喊费拉达斯好大风和扩大双方辣的还是减肥哈啥地方了回怼撒复活卡戴珊附属卡电话";
    text3.numberOfLines=0;
    text3.frame=CGRectMake(75, 20, 414-75-20, 60);
    
    [cell.contentView addSubview:img];
    [cell.contentView addSubview:text1];
    [cell.contentView addSubview:text2];
    [cell.contentView addSubview:text3];
    [cell.contentView addSubview:img2];
//
//
  // cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//每一个单元格被选中后怎么办------跳转到详细界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // NSLog(@"这行被选中了%ld",(long)indexPath.row);
    
    //判断是要编辑还是要查看详细信息
    if (tableView.isEditing){
        //编辑 选完后 就可以删除或者怎么样的
        return;
    }else{
        //查看详细信息
    //找到单元格
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    //找到目的视图
    detailViewController *detail=[detailViewController createNewOne:cell.textLabel.text];
   // detail.view.backgroundColor=[UIColor whiteColor];
    
    //用自己的navigation Controller 跳转
    [self.navigationController pushViewController:detail animated:YES];
    }
}


////编辑模式  名称
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return @"Delete";
//}
////编辑模式 样式 左滑动 之类的
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return  UITableViewCellEditingStyleDelete;
//}
////编辑模式 删除
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//        NSLog(@"dd");
//
//        }
//}

//实现多个按钮选项  swipeAction   trailing
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Action数组
       //1.删除
    UIContextualAction *act1=[UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:NULL handler:^(UIContextualAction *action,UIView *sourceView,void(^com)(BOOL)){
        if (com){
            NSLog(@"这是删除");
        }else{
        NSLog(@"这啥也不是");
        }
    }];
       //配置title img background handler
    act1.image=[[UIImage systemImageNamed:@"trash.fill"] imageWithTintColor:[UIColor whiteColor]];
    act1.backgroundColor=[UIColor redColor];
       //2.静音 void (^UIContextualActionHandler)(UIContextualAction *action, __kindof UIView *sourceView, void (^completionHandler)(BOOL actionPerformed));

    UIContextualAction *act2=[UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:NULL handler:^(UIContextualAction *action,UIView *sourceView,void(^com)(BOOL)){
        NSLog(@"这是静音");
    }];
       //配置title img background handler
    act2.image=[[UIImage systemImageNamed:@"bell.slash.fill"] imageWithTintColor:[UIColor whiteColor]];
    
    act2.backgroundColor=[UIColor purpleColor];
    
    
    //创建swipeAction对象
    UISwipeActionsConfiguration *actions=[UISwipeActionsConfiguration configurationWithActions:@[act1,act2]];
    return actions;
}
// leading
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //置顶--创建置顶的action
    UIContextualAction *action1=[UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:NULL handler:^(UIContextualAction *action,UIView *view,void(^complete)(BOOL)){
        
        NSLog(@"这是置顶%@",complete);
    }];
    //图片
    action1.image=[[UIImage systemImageNamed:@"pin.fill"] imageWithTintColor:[UIColor whiteColor]];
    //背景色
    action1.backgroundColor=[UIColor orangeColor];
    //创建对象
    UISwipeActionsConfiguration *actions=[UISwipeActionsConfiguration configurationWithActions:@[action1]];
    return actions;
    
}

//全选的样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
}
- (void)chooseAll{
    [self.tableView setEditing:YES animated:YES];
}
//取消
- (void)cancelAll{
    //NSLog(@"取消全部");
    //不再编辑
    [self.tableView setEditing:NO animated:YES];
    //不再显示toolBar
    [self.navigationController setToolbarHidden:YES animated:YES];
    //item还原
    self.navigationItem.leftBarButtonItem=self.bt;
}
//当选中select的时候 从底部弹出一个自定义的view
- (void)pushNewOne{
    
    //显示它
    [self.navigationController setToolbarHidden:NO animated:true];
    
}
//底部弹出的readAll点击后执行的操作
- (void)readall{
    NSLog(@"readALL");
  

}
//
- (void)deleteall{
    NSLog(@"deleteall");
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"searchBar取消了");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"我要发送新消息了");
}




@end
