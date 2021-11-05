//
//  TableViewCell.m
//  Btest
//
//  Created by 林锋 on 2021/10/26.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.messageContent.numberOfLines=2;
   // NSLog(@"%@",self.messageContent.text);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
