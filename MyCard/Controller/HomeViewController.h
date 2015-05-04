//
//  HomeViewController.h
//  MyCard
//
//  Created by xujiaqi on 15/4/28.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *ageLabel;

- (IBAction)addPerson;
- (IBAction)deletePerson;
- (IBAction)updatePerson;
- (IBAction)queryPerson;


@end
