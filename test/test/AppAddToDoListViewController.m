//
//  AppAddToDoListViewController.m
//  test
//
//  Created by Andy Wang on 3/12/14.
//  Copyright (c) 2014 Andy Wang. All rights reserved.
//

#import "AppAddToDoListViewController.h"

@interface AppAddToDoListViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AppAddToDoListViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if (sender != self.doneButton) return;
  if (self.textField.text.length > 0) {
    
  }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)addToDoItem:(NSString *)str
{
  AppToDoItemNSObject *item = [[AppToDoItemNSObject alloc] init];
  item.itemName = str;
  item.completed = NO;
  [self.toDoItems addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
