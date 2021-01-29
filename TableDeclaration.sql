PRAGMA foreign_keys = ON;

Create Table Entry ( --Parent table for hyperlink entries. A row in this table can be linked to one or more of the child tables.
  EntryID INTEGER PRIMARY KEY AUTOINCREMENT,
  Type varchar,
  Name Varchar,
  PostDate TIMESTAMP Default CURRENT_TIMESTAMP,
  Link varchar, --hyperlink to the content to be tagged/indexed
  Language varchar
  );
Create Table Text_Entry ( --to index text media
  TEntryID INTEGER PRIMARY KEY REFERENCES Entry(EntryID) ON DELETE CASCADE,
  Charcount INTEGER unsigned, --number of characters
  Wordcount INTEGER unsigned  --number of words
  );
  
Create table Image_Entry (
  IEntryID INTEGER PRIMARY KEY REFERENCES Entry(EntryID) ON DELETE CASCADE,
  VertRes INTEGER unsigned,
  HorRes INTEGER unsigned,
  FileSize Float unsigned 
  );
  
CREATE Table Video_Entry (
  VEntryID INTEGER PRIMARY KEY REFERENCES Entry(EntryID) ON DELETE CASCADE,
  Duration INTEGER unsigned,
  VertRes INTEGER UNSIGNED,
  HorRes INTEGER unsigned,
  FileSize float unsigned
  );
  
Create Table Tags ( --master list of tags. the tag name is used as the key since each tag should be unique
  TagName Varchar primary KEY
  );
  
Create table EntryTagged ( --table linking tags and entries which are tagged
  TName varchar REFERENCES Tag(TagName) ON UPDATE CASCADE ON DELETE CASCADE,
  EntID INTEGER REFERENCES Entry(EntryID) ON DELETE CASCADE,
  Primary key(Tname, EntID)
  );


  
Create table SeriesParent ( --parent table for series tables
  SeriesID INTEGER PRIMARY KEY AUTOINCREMENT
  );

Create Table Text_Series (
  TSeriesID INTEGER PRIMARY KEY REFERENCES SeriesParent(SeriesID) ON DELETE CASCADE,
  Name varchar,
  Language Varchar,
  AverageCharCount INTEGER unsigned, 
  TotalCharCount INTEGER unsigned,
  AverageWordCount INTEGER unsigned,
  TotalWordCount INTEGER unsigned,
  EntryCount INTEGER unsigned,
  LastUpdate datetime
  );
  
Create table Image_Series (
  ISeriesID INTEGER PRIMARY KEY REFERENCES SeriesParent(SeriesID) ON DELETE CASCADE,
  Name VarChar,
  Language varchar,
  TotalSize float unsigned,
  EntryCount INTEGER unsigned,
  LastUpdate datetime
  );
  
Create table Video_Series (
  VSeriesID integer PRIMARY KEY REFERENCES SeriesParent(SeriesID) ON DELETE CASCADE,
  Name Varchar,
  Language Varchar,
  AvgDur INTEGER unsigned,
  TotalDur INTEGER unsigned,
  LastUpdate Datetime
  );

Create Table SeriesTagged (
  TName varchar REFERENCES Tag(TagName) ON UPDATE CASCADE ON DELETE CASCADE,
  SerID INTEGER REFERENCES SeriesParent(SeriesID) ON DELETE CASCADE,
  Primary key(TName, SerID)
  );
--next 3 tables mark individual entries as part of a sereis
Create Table TextMember (
  TextID varchar REFERENCES Text_Entry(tentryid) ON DELETE CASCADE,
  TSerID INTEGER REFERENCES Text_Series(tseriesid) ON DELETE CASCADE,
  Primary key(TextID, TSerID)
  );
Create Table VideoMember (
  VideoID varchar REFERENCES Video_Entry(ventryid) ON DELETE CASCADE,
  VideoSID INTEGER REFERENCES Video_Series(vseriesid) ON DELETE CASCADE,
  Primary key(VideoID, VideoSID)
  );
Create Table ImageMember (
  ImageID varchar REFERENCES Image_Entry(ientryid) ON DELETE CASCADE,
  ISerID INTEGER REFERENCES Image_Series(iseriesid) ON DELETE CASCADE,
  Primary key(ImageID, ISerID)
  );



  
  
  
  

