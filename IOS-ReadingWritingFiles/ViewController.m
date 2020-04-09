//
//  ViewController.m
//  IOS-ReadingWritingFiles
//
//  Created by eric on 06/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textField;

@property (weak, nonatomic) IBOutlet UITextView *resultField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //////////////////// Identifying the Current Working Directory
    
    NSLog(@"\n\nIdentifying the Current Working Directory\n");
    
    NSFileManager *filemgr;
    NSString *currentpath;
    
    filemgr = [NSFileManager defaultManager];
    
    currentpath = [filemgr currentDirectoryPath];
    
    NSLog (@"Current directory is %@", currentpath);
    
    //////////////////// Changing to a Different Directory
    
    NSLog(@"\n\nChanging to a Different Directory\n");

    filemgr = [NSFileManager defaultManager];
    
    currentpath = [filemgr currentDirectoryPath];
    
    NSLog (@"Current directory is %@", currentpath);
    
    if ([filemgr changeCurrentDirectoryPath: @"/tmp"] == NO)
        NSLog (@"Cannot change directory.");
    
    currentpath = [filemgr currentDirectoryPath];
    
    NSLog (@"Current directory is %@", currentpath);
    
    //////////////////// Creating a New Directory
    
    NSLog(@"\n\nCreating a New Directory\n");

    filemgr = [NSFileManager defaultManager];
    NSURL *newDir = [NSURL fileURLWithPath:@"/tmp/mynewdir"];
    [filemgr createDirectoryAtURL: newDir withIntermediateDirectories:YES attributes: nil error:nil];
    
    NSLog (@"New directory is %@", newDir);
    NSString *f = [newDir path];
    
    //////////// Deleting a Directory

    NSLog(@"\n\nDeleting a Directory\n");


    filemgr = [NSFileManager defaultManager];

    [filemgr removeItemAtPath: @"/tmp/mynewdir" error:nil];

    
    /////////////// Renaming or Moving a File or Directory
    
    NSLog(@"\n\nRenaming or Moving a File or Directory\n");

    
    filemgr = [NSFileManager defaultManager];
    
    NSURL *oldDir = [NSURL fileURLWithPath:@"/tmp/mynewdir"];
    NSURL *newDir2 = [NSURL fileURLWithPath:@"/tmp/mynewdir2"];
    
    [filemgr moveItemAtURL: oldDir toURL: newDir2 error: nil];
 
    /////////////// Getting a Directory File Listing
    
    NSLog(@"\n\nGetting a Directory File Listing\n");

    NSArray *filelist;
    int c;
    int i;
    
    filemgr = [NSFileManager defaultManager];
    
    filelist = [filemgr contentsOfDirectoryAtPath: currentpath error: nil];
    
    c = [filelist count] ;
    
    for (i = 0; i < c; i++)
        NSLog (@"%@", [filelist objectAtIndex: i]);
       
    //////////////// Getting the Attributes of a File or Directory
    
    NSLog(@"\n\nGetting the Attributes of a File or Directory\n");
    
    NSDictionary *attribs;
    
    filemgr = [NSFileManager defaultManager];
    
    attribs = [filemgr attributesOfItemAtPath: currentpath error: NULL];
    
    NSString *att1 = [attribs objectForKey: NSFileCreationDate];
    NSLog (@"Created on %@", att1);
    NSString *att2 = [attribs objectForKey: NSFileType];
    NSLog (@"File type %@",  att2);
    NSString *att3 = [attribs objectForKey: NSFilePosixPermissions];
    NSLog (@"POSIX Permissions %@",  att3);
    
    //_resultField.text = f;
    //NSString *str = currentpath;
    //str = [str stringByAppendingString:f];
    NSString *str = [NSString stringWithFormat:
                     @"CurrentPath : \n\t%@\nNewDir : \n\t%@\nCreated on : \n\t%@\nFile type : \n\t%@\nPOSIX Permissions  : \n\t%@", currentpath, f,att1, att2, att3];
    _resultField.text = str;
}
@end
