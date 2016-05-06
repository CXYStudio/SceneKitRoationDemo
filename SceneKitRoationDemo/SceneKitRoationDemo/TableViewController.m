//
//  TableViewController.m
//  SceneKitRoationDemo
//
//  Created by tianpengfei on 16/5/6.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "TableViewController.h"
#import "GameViewController.h"

@interface TableViewController ()
@property(strong,nonatomic)NSArray *data;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _data = @[NSLocalizedString(@"normalRoation", @"正常旋转"),NSLocalizedString(@"mathRoation", @"数学方法旋转")];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 # tableview delegate
 
 */


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    cell.textLabel.text = _data[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"goToGame" sender:@(indexPath.row)];

}

/*
#pragma mark - Navigation
*/
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"goToGame"]){
    
        GameViewController *game = [segue destinationViewController];
        game.type = [sender intValue];
    }
    
}


@end
