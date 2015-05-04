//
//  HomeViewController.m
//  MyCard
//
//  Created by xujiaqi on 15/4/28.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "HomeViewController.h"
#import "Person.h"
#import "HomeTableViewCell.h"
#import "DetailViewController.h"
#import "AddBankCardViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - view life cyvle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    
}

- (IBAction)addPerson
{
    NSString *name = self.nameLabel.text;
    NSString *age = self.ageLabel.text;
    if (!name && !age) return;
    
    Person *person = [Person createEntity];
    person.name = name;
    person.age = @([age integerValue]);
    [self.managedObjectContext saveToPersistentStoreAndWait];
    
    NSLog(@"self.managedObjectContext : %p", self.managedObjectContext);
    NSLog(@"person.managedObjectContext : %p", person.managedObjectContext);
    NSLog(@"[NSManagedObjectContext defaultContext] : %p", [NSManagedObjectContext defaultContext]);
}

- (IBAction)deletePerson
{
    NSString *where = [NSString stringWithFormat:@"name LIKE[cd] '*%@*'", self.nameLabel.text];
    NSArray *array = [Person findAllWithPredicate:[NSPredicate predicateWithFormat:where]];
    
    for (Person *person in array) {
        [person deleteEntity];
        [[NSManagedObjectContext defaultContext] saveOnlySelfAndWait];
    }
}

- (IBAction)updatePerson
{
    NSString *where = [NSString stringWithFormat:@"name LIKE[cd] '*%@*'", self.nameLabel.text];
    NSArray *array = [Person findAllWithPredicate:[NSPredicate predicateWithFormat:where]];
    for (Person *person in array) {
        person.age = @([self.ageLabel.text integerValue]);
//        [[NSManagedObjectContext defaultContext] MR_saveOnlySelfWithCompletion:nil];
        [self.managedObjectContext saveOnlySelfAndWait];
    }
}

- (IBAction)queryPerson
{
    NSArray *persons = nil;
    NSString *where = @"name like[cd] '*xujiaqi*' && age BETWEEN {20,28}";
    
//        NSString *where = @"name CONTAINS[cd] 'j'";
//    NSString *where = @"name BEGINSWITH[cd] 'ja'";
//    NSString *where = @"name ENDSWITH[cd] 'qi'";
    
//    NSString *where = @"name LIKE[cd] '*jackie*'";
//    NSString *where = @"name LIKE[cd] 'j??kie'";

//    NSString *regex = @"^j.+e$";
//    NSString *where = [NSString stringWithFormat:@"name MATCHES '%@'", regex];
    
    persons = [Person findAllWithPredicate:[NSPredicate predicateWithFormat:where]];
    DetailViewController *detalVC = [[DetailViewController alloc] init];
    detalVC.dataSource = persons;
    [self.navigationController pushViewController:detalVC animated:YES];
}

@end
