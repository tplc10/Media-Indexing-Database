CREATE TRIGGER TSeriesInsert
	After Insert on TextMember
BEGIN
	Update Text_Series
    Set EntryCount =(select count(*) from TextMember WHERE new.TSerID=TSerID)
    WHERE new.TSerID=tentryid;
    
    UPDATE Text_Series
    Set averagecharcount = (Select AVG(charcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            )
    WHERE new.TSerID=tentryid;
    
    UPDATE Text_Series
    Set totalcharcount = (Select SUM(charcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE new.TSerID=tentryid; 

    UPDATE Text_Series
    Set totalwordcount = (Select SUM(wordcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE new.TSerID=tentryid; 
    
    UPDATE Text_Series
    Set averagewordcount = (Select AVG(wordcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE new.TSerID=tentryid;
End;



CREATE TRIGGER TSeriesUpdate
	After UPDATE on TextMember
BEGIN
    UPDATE Text_Series
    Set averagecharcount = (Select AVG(charcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            )
    WHERE new.TSerID=tentryid;
    
    UPDATE Text_Series
    Set totalcharcount = (Select SUM(charcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE new.TSerID=tentryid; 

    UPDATE Text_Series
    Set totalwordcount = (Select SUM(wordcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE new.TSerID=tentryid; 
    
    UPDATE Text_Series
    Set averagewordcount = (Select AVG(wordcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE new.TSerID=tentryid;
End;



CREATE TRIGGER TSeriesDelete
	After DELETE on TextMember
BEGIN
	Update Text_Series
    Set EntryCount =(select count(*) from TextMember WHERE old.TSerID=TSerID)
    WHERE old.TSerID=tentryid;
    
    UPDATE Text_Series
    Set averagecharcount = (Select AVG(charcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            )
    WHERE old.TSerID=tentryid;
    
    UPDATE Text_Series
    Set totalcharcount = (Select SUM(charcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE old.TSerID=tentryid; 

    UPDATE Text_Series
    Set totalwordcount = (Select SUM(wordcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE old.TSerID=tentryid; 
    
    UPDATE Text_Series
    Set averagewordcount = (Select AVG(wordcount) From TextMember, Text_Entry, Text_Series
                            WHERE textid=tentryid
                            and tseriesid=tserid
                            and TSerID=TSerID)
    WHERE old.TSerID=tentryid;
    
      UPDATE Text_Series
    Set lastupdate = datetime('now')
    	WHERE old.tserid = textid;
End;












Create TRIGGER VSeriesUpdate
	After UPDATE on VideoMember
BEGIN
    
    UPDATE Video_Series
    Set totaldur = (Select SUM(duration) From VideoMember, Video_Entry, Video_Series
                            WHERE VideoID=ventryid
                            and vseriesid=videosid
                    )
    WHERE new.vseriesid=vseriesid; 

	UPDATE Video_Series
    Set avgdur = (Select AVG(duration) From VideoMember, Video_Entry, Video_Series
                            WHERE VideoID=ventryid
                            and vseriesid=videosid
                    )
    WHERE new.vseriesid=vseriesid; 
    
    UPDATE Video_Series
    Set lastupdate = datetime('now')
    	WHERE new.videoSID = videoSID;
    
	End;

CREATE TRIGGER VSeriesInsert
	After Insert on VideoMember
BEGIN
	Update Video_Series
    Set EntryCount =(select count(videoid) from VideoMember WHERE new.videosid=videosid)
    WHERE vseriesid=new.videoSID;

    
    UPDATE Video_Series
    Set totaldur = (Select SUM(duration) From VideoMember, Video_Entry, Video_Series
                            WHERE VideoID=ventryid
                            and vseriesid=videosid
                    )
    WHERE new.videoSID=vseriesid; 

	UPDATE Video_Series
    Set avgdur = (Select AVG(duration) From VideoMember, Video_Entry, Video_Series
                            WHERE VideoID=ventryid
                            and vseriesid=videosid
                    )
    WHERE new.videosid=vseriesid; 
    
    UPDATE Video_Series
    Set lastupdate = datetime('now')
    	WHERE new.videoSID = vseriesid;
    
	End


Create TRIGGER VSeriesDelete
	After Delete on VideoMember
BEGIN
    Update Video_Series
    Set EntryCount =(select count(videoid) from VideoMember WHERE old.videosid=videosid)
    WHERE vseriesid=old.videosid;

    UPDATE Video_Series
    Set totaldur = (Select SUM(duration) From VideoMember, Video_Entry, Video_Series
                            WHERE VideoID=ventryid
                            and vseriesid=videosid
                    )
    WHERE old.vseriesid=vseriesid; 

	UPDATE Video_Series
    Set avgdur = (Select AVG(duration) From VideoMember, Video_Entry, Video_Series
                            WHERE VideoID=ventryid
                            and vseriesid=videosid
                    )
    WHERE old.vseriesid=vseriesid; 
    
    UPDATE Video_Series
    Set lastupdate = datetime('now')
    	WHERE old.videoSID = videoSID;
END;












Create TRIGGER ISeriesDelete
	After DELETE on ImageMember
BEGIN
	Update Image_Series
    Set EntryCount =(select count(imageid) from ImageMember WHERE old.iserid=iserid)
    	WHERE iserid=old.iserid;

    UPDATE Image_Series
    Set totalsize = (Select SUM(filesize) From ImageMember, Image_Entry, Image_Series
                            WHERE imageid=ientryid
                            and iseriesid=iserid
                            )
    	WHERE new.iserid=iseriesid;
    
    UPDATE Image_Series
    	Set lastupdate = datetime('now')
    WHERE old.iserid = iseriesid;
End;


CREATE TRIGGER ISeriesUpdate
	After UPDATE on ImageMember
BEGIN
    UPDATE Image_Series
    Set totalsize = (Select SUM(filesize) From ImageMember, Image_Entry, Image_Series
                            WHERE imageid=ientryid
                            and iseriesid=iserid
                            )
    WHERE new.iserid=iseriesid;
    
    UPDATE Image_Series
    	Set lastupdate = datetime('now')
    WHERE new.iserid = iseriesid;

End;


