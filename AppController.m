//
//  UAGithubEngineAppDelegate.m
//  UAGithubEngine
//
//  Created by Owain Hunt on 02/04/2010.
//  Copyright 2010 Owain R Hunt. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	githubEngine = [[UAGithubEngine alloc] initWithUsername:@"owainhunt" password:@"23twyx24" delegate:self withReachability:YES];

//	[githubEngine user:githubEngine.username];
//	[githubEngine searchUsers:@"owainhunt" byEmail:NO];
//	
//	[githubEngine repositoriesForUser:@"owainhunt" includeWatched:YES];
//	[githubEngine repository:@"owainhunt/uagithubengine"];
//	[githubEngine searchRepositories:@"rails"];
//	[githubEngine updateRepository:@"owainhunt/uagithubengine" withInfo:[NSDictionary dictionaryWithObject:@"1" forKey:@"has_downloads"]];
//	[githubEngine watchRepository:@"github/markup"];
//	[githubEngine unwatchRepository:@"github/markup"];
//	[githubEngine forkRepository:@"github/markup"];
//	[githubEngine createRepositoryWithInfo:[NSDictionary dictionaryWithObject:@"APICreation" forKey:@"name"]];
//	[githubEngine publiciseRepository:@"uagithubengine"];
//	[githubEngine privatiseRepository:@"uagithubengine"];
//	[githubEngine deployKeysForRepository:@"uagithubengine"];
//	[githubEngine addDeployKey:@"" withTitle:@"Test Key" ToRepository:@"uagithubengine"];
//	[githubEngine removeDeployKey:@"391578" fromRepository:@"uagithubengine"];
//	[githubEngine collaboratorsForRepository:@"rails/rails"];
//	[githubEngine addCollaborator:@"orhunt" toRepository:@"uagithubengine"];
//	[githubEngine removeCollaborator:@"orhunt" fromRepository:@"uagithubengine"];
//	[githubEngine pushableRepositories];
//	[githubEngine networkForRepository:@"rails/rails"];
//	[githubEngine languageBreakdownForRepository:@"rails/rails"];
//	[githubEngine tagsForRepository:@"owainhunt/loops"];
//	[githubEngine branchesForRepository:@"owainhunt/uagithubengine"];
//	
//	[githubEngine commitsForBranch:@"owainhunt/uagithubengine/api3"];
//	[githubEngine commit:@"owainhunt/uagithubengine/e7777a70edc4f656678c6f79efcf82a44d5bd041"];
//    
//  [githubEngine milestonesForRepository:@"owainhunt/uagithubengine"];
//  [githubEngine createMilestoneWithInfo:[NSDictionary dictionaryWithObject:@"Test Milestone" forKey:@"title"] forRepository:@"owainhunt/uagithubengine"];
//  [githubEngine milestone:1 forRepository:@"owainhunt/uagithubengine"];
//  [githubEngine updateMilestone:1 forRepository:@"owainhunt/uagithubengine" withInfo:[NSDictionary dictionaryWithObject:@"Edited Test Milestone" forKey:@"title"]];
//  [githubEngine deleteMilestone:1 forRepository:@"owainhunt/uagithubengine"];
//
//	[githubEngine issuesForRepository:@"owainhunt/uagithubengine" withParameters:nil requestType:UAGithubIssuesRequest];
//	[githubEngine issue:8 inRepository:@"owainhunt/uagithubengine"];
//	[githubEngine editIssue:@"owainhunt/uagithubengine/1" withDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"Test Issue [edited]", @"title", @"Test body [edited again]", @"body", nil]];
//	[githubEngine addIssueForRepository:@"owainhunt/UAGithubEngine" withDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"Testing basic auth", @"title", @"Test body", @"body", nil]];
//	[githubEngine closeIssue:@"owainhunt/uagithubengine/1"];
//	[githubEngine reopenIssue:@"owainhunt/uagithubengine/1"];
//
	[githubEngine labelsForRepository:@"owainhunt/uagithubengine"];
//	[githubEngine addLabel:@"Super_Hyper_Mega_Bug" toIssue:1 inRepository:@"owainhunt/uagithubengine"];
//	[githubEngine removeLabel:@"TODO" fromIssue:8 inRepository:@"owainhunt/uagithubengine"];
//	[githubEngine addLabelToRepository:@"owainhunt/uagithubengine" withDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"test_label", @"name", @"000000", @"color", nil]];
//	[githubEngine removeLabel:@"test_label" fromRepository:@"owainhunt/uagithubengine"];
//  [githubEngine addLabels:[NSArray arrayWithObjects:@"TODO", nil] toIssue:8 inRepository:@"owainhunt/uagithubengine"];
//	
//	[githubEngine commentsForIssue:@"owainhunt/uagithubengine/1"];
//	[githubEngine addComment:@"This thing is still awesome." toIssue:@"owainhunt/uagithubengine/1"];
//	
//	[githubEngine tree:@"owainhunt/uagithubengine/2af97f0e241c13345212"];
//	
//	[githubEngine blobsForSHA:@"owainhunt/uagithubengine/f4667fc9a965b8f9438b8776ad61f0d5c5074e88"];
//	[githubEngine blob:@"owainhunt/uagithubengine/f4667fc9a965b8f9438b8776ad61f0d5c5074e88/main.m"];
//	[githubEngine rawBlob:@"owainhunt/uagithubengine/14d56058704dd3e046edaec20e93597867ef761e"];
	
}

- (void)dealloc
{
	[githubEngine release];
	[super dealloc];
	
}


#pragma mark UAGithubEngineDelegate Methods

- (void)requestSucceeded:(NSString *)connectionIdentifier
{
	NSLog(@"Request succeeded: %@", connectionIdentifier);
}


- (void)requestFailed:(NSString *)connectionIdentifier withError:(NSError *)error
{
    NSLog(@"Request failed: %@, error: %@ (%@)", connectionIdentifier, [error localizedDescription], [error userInfo]);	
}


#pragma mark UAGithubURLConnection Delegate Methods

- (void)connectionFinished:(NSString *)connectionIdentifier
{
    NSLog(@"Connection finished %@", connectionIdentifier);
	
	if ([githubEngine.connections count] == 0)
	{
		[NSApp terminate:self];
	}
	
}


- (void)repositoriesReceived:(NSArray *)repositories forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received repositories for connection: %@, %@", connectionIdentifier, repositories);
}


- (void)milestonesReceived:(NSArray *)milestones forConnection:(NSString *)connectionIdentifier
{
    NSLog(@"Received milestones for connection: %@, %@", connectionIdentifier, milestones);
}


- (void)deployKeysReceived:(NSArray *)deployKeys forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received deployKeys for connection: %@, %@", connectionIdentifier, deployKeys);
}


- (void)collaboratorsReceived:(NSArray *)collaborators forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received collaborators for connection: %@, %@", connectionIdentifier, collaborators);
}


- (void)languagesReceived:(NSArray *)languages forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received languages for connection: %@, %@", connectionIdentifier, languages);
}


- (void)tagsReceived:(NSArray *)tags forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received tags for connection: %@, %@", connectionIdentifier, tags);
}


- (void)branchesReceived:(NSArray *)branches forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received branches for connection: %@, %@", connectionIdentifier, branches);
}


- (void)issuesReceived:(NSArray *)issues forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received issues for connection: %@, %@", connectionIdentifier, issues);
}


- (void)issueCommentsReceived:(NSArray *)issueComments forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received issueComments for connection: %@, %@", connectionIdentifier, issueComments);	
}


- (void)labelsReceived:(NSArray *)labels forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received labels for connection: %@, %@", connectionIdentifier, labels);
}


- (void)usersReceived:(NSArray *)users forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received users for connection: %@, %@", connectionIdentifier, users);	
}


- (void)commitsReceived:(NSArray *)commits forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received commits for connection: %@, %@", connectionIdentifier, commits);	
}


- (void)treeReceived:(NSArray *)treeContents forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received tree contents for connection: %@, %@", connectionIdentifier, treeContents);	
}


- (void)blobsReceieved:(NSArray *)blobs forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received blobs for connection: %@, %@", connectionIdentifier, blobs);
}


- (void)blobReceived:(NSArray *)blob forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received blob for connection: %@, %@", connectionIdentifier, blob);
}


- (void)rawBlobReceived:(NSData *)blob forConnection:(NSString *)connectionIdentifier
{
	NSLog(@"Received blob for connection: %@, %@", connectionIdentifier, [[[NSString alloc] initWithData:blob encoding:NSASCIIStringEncoding] autorelease]);
}


@end