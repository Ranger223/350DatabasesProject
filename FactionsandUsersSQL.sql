USE [Milestone3]
GO

INSERT INTO [dbo].[FACTION]
           ([FactionName])
     VALUES
           ('The Church Of Spiffo'),
           ('United Space Of America'),
           ('The Cult Of Moments'),
           ('The Anarchists Union'),
           ('The Kin'),
           ('Alpha Centauri Fan Club'),
           ('Fuze'),
           ('Orion Baking Society'),
           ('Enigma Books'),
           ('Louisville Historical Society'),
GO

INSERT INTO [dbo].[DBUSER]
     VALUES
           ('funkyspacesattellite', 'comet@spacegmail.com', 1234, 1, 10),
           ('spaceunclesam', 'WENEEDYOU@spaceusa.gov', 1234, 0, 1),
           ('captainshark', 'CaptainShark@braves.com', 1234, 2, 4),
           ('prettypurpleplane', 'aether@pollux.com', 1234, 3, 9),
           ('smilingallthetime', 'sidesplit@dirge.com', 1234, 4, 9),
           ('vendingmachineoflove', 'sodapop@spacegmail.com', 1234, 1, 8),
           ('werewolfvampire', 'darkfall@spacegmail.com', 1234, 3, NULL)
GO
