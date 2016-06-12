//
//  ViewController.m
//  TCNavigationBarManager
//
//  Created by TailC on 16/6/12.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,readwrite,strong) UIImageView *barImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
	[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	self.navigationController.navigationBar.barTintColor = [UIColor redColor];
	self.barImageView = self.navigationController.navigationBar.subviews.firstObject;
	
	[self.navigationController.navigationBar setBackgroundImage:self.barImageView.image
												  forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [UIImage new];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark <UITableViewDelegate><UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
	return cell;
}

#pragma mark <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	CGFloat minAlphaOffset = - 64;
	CGFloat maxAlphaOffset = 200;
	CGFloat offset = scrollView.contentOffset.y;
	CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
	_barImageView.alpha = alpha;
}

@end
