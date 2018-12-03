//
//  ViewController.m
//  level30-31
//
//  Created by Pavel Scope on 01/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)deleteAction:(UIButton *)sender;
- (IBAction)testAction:(UIButton *)sender;
@property (strong,nonatomic) NSArray * array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
   // self.tableView.scrollEnabled = false;
    
    NSArray * array = @[@"1",@"2",@"3",@"4"];
    self.array = array;
    NSLog(@"%ld",self.array.count) ;
   
}

#pragma mark - UITableViewDataSource

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSString * string =  [self.array objectAtIndex:indexPath.row];
        NSMutableArray * mutArray = [NSMutableArray arrayWithArray:self.array];
        [mutArray removeObject:string];
        self.array = mutArray;
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [tableView endUpdates];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * inditificator = @"inditificator";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:inditificator];
    
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inditificator];
    }
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    
    return cell;
}
#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return CGFLOAT_MIN;
}



- (IBAction)deleteAction:(UIButton *)sender {
   
 

    for(int i = 0 ; i < 4; i++) {
        NSIndexPath * index =  [NSIndexPath indexPathForRow:0 inSection:0];
        NSString * string =  [self.array objectAtIndex:0];
        NSMutableArray * mutArray = [NSMutableArray arrayWithArray:self.array];
        [mutArray removeObject:string];
        self.array = mutArray;
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView endUpdates];
    }
    }


- (IBAction)testAction:(UIButton *)sender {
    NSMutableArray * arrayTest = [NSMutableArray array];
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 1; i <= 4; i++) {
        NSString * string = [NSString stringWithFormat:@"%d",i ];
        [array addObject:string];
         self.array = array;
    
    
  
        NSIndexPath * index =  [NSIndexPath indexPathForRow:0 inSection:0];
        [arrayTest addObject:index];
        
        
    }
    NSArray * arrayTest2 = [NSArray arrayWithArray:arrayTest];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[arrayTest2] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}




@end
