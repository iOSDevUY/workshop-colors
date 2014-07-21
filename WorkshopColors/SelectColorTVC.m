//
//  SelectColorTVC.m
//  WorkshopColors
//
//  Created by Nicolas Alliaume on 21/07/14.
//  Copyright (c) 2014 ADMVD. All rights reserved.
//

#import "SelectColorTVC.h"
#import "ColorsManager.h"
#import "ColorVC.h"

@interface SelectColorTVC ()

@property (nonatomic, strong) NSArray *colors;

@end

@implementation SelectColorTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadColors];
}

- (void)loadColors
{
    [[ColorsManager sharedManager] fetchColors:^(NSArray *colors) {
        
        _colors = colors;
        [self.tableView reloadData];
        
    } failed:^(NSString *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ouch!" message:@"This guys from ADMVD think this app can be used without Internet! They're insane!" delegate:nil cancelButtonTitle:@"Yeahp..." otherButtonTitles: nil];
        [alert show];
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *color = [_colors objectAtIndex:indexPath.row];
    
    UIColor *realColor = [[ColorsManager sharedManager] colorForRGBString:color[@"rgb"]];
    
    cell.textLabel.text = color[@"name"];
    cell.detailTextLabel.text = color[@"hex"];
    cell.backgroundColor = realColor;
    cell.textLabel.textColor = [[UIColor colorWithRed:1.f green:1.f blue:1.f alpha:1.0] isEqual:realColor] ? [UIColor grayColor] : [UIColor whiteColor];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"color"] && [segue.destinationViewController isKindOfClass:[ColorVC class]]) {
        
        NSDictionary *color = [_colors objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        [segue.destinationViewController setSelectedColor:color];
    }
}

@end
