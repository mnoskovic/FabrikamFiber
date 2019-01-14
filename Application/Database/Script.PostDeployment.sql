/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF NOT EXISTS (SELECT * FROM Employees)
BEGIN

	BEGIN TRANSACTION
		ALTER TABLE [dbo].[ServiceLogEntries] DROP CONSTRAINT [ServiceLogEntry_CreatedBy]
		ALTER TABLE [dbo].[ServiceLogEntries] DROP CONSTRAINT [ServiceLogEntry_ServiceTicket]
		ALTER TABLE [dbo].[ScheduleItems] DROP CONSTRAINT [ScheduleItem_Employee]
		ALTER TABLE [dbo].[ScheduleItems] DROP CONSTRAINT [ScheduleItem_ServiceTicket]
		ALTER TABLE [dbo].[ServiceTickets] DROP CONSTRAINT [ServiceTicket_AssignedTo]
		ALTER TABLE [dbo].[ServiceTickets] DROP CONSTRAINT [ServiceTicket_CreatedBy]
		ALTER TABLE [dbo].[ServiceTickets] DROP CONSTRAINT [ServiceTicket_Customer]
		SET IDENTITY_INSERT [dbo].[ServiceTickets] ON
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (1, N'Modem keeps resetting itself', N'About two months ago, I started getting randomly disconnected. My modem would lose its ONLINE green light, then the SEND light, then the RECEIVE, and then finally the POWER light would go and the modem would reset itself. I bought the new one wondering if it my old router might be the problem (it was fairly old). However, the problem still persists', 3, 1, '20170214 14:40:33.560', NULL, 1, 1, 2)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (2, N'Internet Upload speed slow from 11pm-11am', N'I''m extremely unhappy with the service I have recieved as of late from FabFiber. At night, my upload is garbage. I have the extreme 50 package and I''m only getting 1mb upload and anywhere from 1%-16% packetloss. This has been going on for a week and a half now.  I''ve had two techs come out here now and nobody seems to know what is going on.', 1, 2, '20170214 14:40:33.573', '20170217 14:40:33.573', 1, 2, 3)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (3, N'FabFiber is the worst EVER!!!', N'You guys set up and no-showed two service appointments in a row. You call, they set the appointment, then reschedule it (without notifying me) and of course the guarantee no longer applies.', 0, 1, '20170215 13:45:33.573', NULL, 2, 2, NULL)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (4, N'changing channel by it self', N'TV changes channels by it self I even removed the batteries from remote and it still kept changing channels every couple of minutes what is going on this happen on only one tv out of 5 in the house?', 3, 1, '20170214 14:40:33.573', NULL, 3, 2, 2)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (5, N'Viewing Recorded Programs', N'I would like to know if it is possible to adjust the amount of "fast-forward" or "fast-rewind" time, using the remote, while viewing a recorded program.As the remote is set, the fast-forward goes somewhat too far ahead.', 3, 2, '20170214 14:40:33.577', NULL, 4, 2, 3)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (6, N'Issues with service', N'About a month ago I started having issues with the TV, internet and phone. The TV was pixelating and when this happened I would also lose the internet connection and phone. I called and a technician came, he said the issue was with with a lose connection with the wires outside in the apartment complex. After he came in and fixed it, the issue went away for a few weeks. Now it''s back', 3, 1, '20170215 13:45:33.577', NULL, 5, 2, 1)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (7, N'Poor Picture Quality', N'I just purchased a Fibrikam Fiber bundle and I am very dissatisfied with the picture quality to say the least. So far, two different service representatives have been out to look at the issue.  My picture is horribly fuzzy, grainy, blurry, and almost unwatchable.  The issue goes away when I hook the coax directly through my TV as opposed to using the provided cable box, but then I do not get as many channels.  The last service tech told me that you made some sort of change a while back and the picture quality has been poor ever since', 3, 1, '20170214 14:40:33.577', NULL, 6, 2, 1)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (8, N'Channels gone!', N'I got a digital set-top box 2 years ago. Since then I get all the HD channels, basic channels, and a bunch of channels in the 200''s. Since yesterday, when I turn to these stations in the 200s a gray box appears that says, "Subscription Service." Is this just a temporary problem? Why can I no longer access these channels? I am still paying the same amount, what is going on?', 3, 2, '20170214 14:40:33.580', NULL, 7, 1, 3)
		INSERT INTO [dbo].[ServiceTickets] ([ID], [Title], [Description], [StatusValue], [EscalationLevel], [Opened], [Closed], [CustomerID], [CreatedByID], [AssignedToID]) VALUES (9, N'Not getting all my channels', N'I don''t have access to all the channels I supposedly get.  Every channel gives me the message that I need to contact Fabrikam Fiber to subscribe, even though it is on the lineup I print out.  I went to the local office and they said it starts November 1.  Well it is November 2 and still no access', 3, 1, '20170215 13:45:33.580', NULL, 8, 1, 3)
		SET IDENTITY_INSERT [dbo].[ServiceTickets] OFF
		SET IDENTITY_INSERT [dbo].[ScheduleItems] ON
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (1, 2, 1, '20110516 08:00:00.000', 1, '20170214 14:40:33.567')
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (2, 2, 4, '20110516 09:30:00.000', 1, '20170214 14:40:33.573')
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (3, 1, 5, '20110516 10:00:00.000', 1, '20170214 14:40:33.577')
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (4, 1, 6, '20110516 13:00:00.000', 1, '20170214 14:40:33.577')
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (5, 1, 7, '20110516 14:00:00.000', 1, '20170214 14:40:33.577')
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (6, 3, 8, '20110516 08:00:00.000', 1, '20170214 14:40:33.580')
		INSERT INTO [dbo].[ScheduleItems] ([ID], [EmployeeID], [ServiceTicketID], [Start], [WorkHours], [AssignedOn]) VALUES (7, 3, 9, '20110516 12:00:00.000', 1, '20170214 14:40:33.580')
		SET IDENTITY_INSERT [dbo].[ScheduleItems] OFF
		SET IDENTITY_INSERT [dbo].[Employees] ON
		INSERT INTO [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (1, N'Jonathan', N'Carter', N'123 Standard Street', N'Redmond', N'WA', N'98052', NULL, NULL)
		INSERT INTO [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (2, N'Drew', N'Robbins', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052', N'NORTHAMERICA\drobbins', NULL)
		INSERT INTO [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (3, N'Brian', N'Keller', N'361 North Avenue', N'Redmond', N'WA', N'98052', NULL, NULL)
		INSERT INTO [dbo].[Employees] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip], [Identity], [ServiceAreas]) VALUES (4, N'James', N'Conard', N'9342 2nd Street', N'Redmond', N'WA', N'98052', NULL, NULL)
		SET IDENTITY_INSERT [dbo].[Employees] OFF
		SET IDENTITY_INSERT [dbo].[ServiceLogEntries] ON
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (1, '20170214 14:40:33.570', N'Opened ticket for customer', 2, 1)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (2, '20170214 14:40:33.573', N'Opened ticket for customer', 2, 2)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (3, '20170215 13:45:33.573', N'Opened ticket for customer', 2, 3)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (4, '20170214 14:40:33.577', N'Opened ticket for customer', 2, 4)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (5, '20170214 14:40:33.577', N'Opened ticket for customer', 2, 5)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (6, '20170215 13:45:33.577', N'Opened ticket for customer', 2, 6)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (7, '20170214 14:40:33.577', N'Opened ticket for customer', 2, 7)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (8, '20170214 14:40:33.580', N'Opened ticket for customer', 2, 8)
		INSERT INTO [dbo].[ServiceLogEntries] ([ID], [CreatedAt], [Description], [CreatedByID], [ServiceTicketID]) VALUES (9, '20170215 13:45:33.580', N'Opened ticket for customer', 2, 9)
		SET IDENTITY_INSERT [dbo].[ServiceLogEntries] OFF
		SET IDENTITY_INSERT [dbo].[Customers] ON
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (1, N'Maria', N'Cameron', N'One Microsoft Way', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (2, N'Antonio', N'Alwan', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (3, N'Patrick', N'Cook', N'123 Standard Street', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (4, N'Jane', N'Dow', N'9342 2nd Street', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (5, N'Michele', N'Martin', N'361 North Avenue', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (6, N'Dan', N'Bacon', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (7, N'Johnson', N'Apacible', N'123 Standard Street', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (8, N'Pilar', N'Ackerman', N'9342 2nd Street', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (9, N'David', N'Alexander', N'361 North Avenue', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (10, N'Jose', N'Auricchio', N'45 Greenbelt Way', N'Redmond', N'WA', N'98052')
		INSERT INTO [dbo].[Customers] ([ID], [FirstName], [LastName], [Address_Street], [Address_City], [Address_State], [Address_Zip]) VALUES (11, N'Ty', N'Carlson', N'123 Standard Street', N'Redmond', N'WA', N'98052')
		SET IDENTITY_INSERT [dbo].[Customers] OFF
		SET IDENTITY_INSERT [dbo].[EdmMetadata] ON
		INSERT INTO [dbo].[EdmMetadata] ([Id], [ModelHash]) VALUES (1, N'3625E7857CBAFE34AB55E19843CC439A6FFF542C32BB5BA365E5D0EC05E7599A')
		SET IDENTITY_INSERT [dbo].[EdmMetadata] OFF
		ALTER TABLE [dbo].[ServiceLogEntries]
			ADD CONSTRAINT [ServiceLogEntry_CreatedBy] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Employees] ([ID])
		ALTER TABLE [dbo].[ServiceLogEntries]
			ADD CONSTRAINT [ServiceLogEntry_ServiceTicket] FOREIGN KEY ([ServiceTicketID]) REFERENCES [dbo].[ServiceTickets] ([ID]) ON DELETE CASCADE
		ALTER TABLE [dbo].[ScheduleItems]
			ADD CONSTRAINT [ScheduleItem_Employee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([ID]) ON DELETE CASCADE
		ALTER TABLE [dbo].[ScheduleItems]
			ADD CONSTRAINT [ScheduleItem_ServiceTicket] FOREIGN KEY ([ServiceTicketID]) REFERENCES [dbo].[ServiceTickets] ([ID]) ON DELETE CASCADE
		ALTER TABLE [dbo].[ServiceTickets]
			ADD CONSTRAINT [ServiceTicket_AssignedTo] FOREIGN KEY ([AssignedToID]) REFERENCES [dbo].[Employees] ([ID])
		ALTER TABLE [dbo].[ServiceTickets]
			ADD CONSTRAINT [ServiceTicket_CreatedBy] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Employees] ([ID])
		ALTER TABLE [dbo].[ServiceTickets]
			ADD CONSTRAINT [ServiceTicket_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID])
	COMMIT TRANSACTION

END