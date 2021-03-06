# Script for Time Utils *without* using Lubridate library
# SVN: $Id: TimeUtilsNoLubridate.R 526 2012-03-04 23:19:05Z rob $

time.Now.str<-function()
{
    format(Sys.time(), "%Y-%m-%d %H:%M:%OS3")
}

interpretElapsedTime<-function(start,end)
{
    retObj<-list()
    
    if(is.POSIXct(start) & is.POSIXct(end) )
    {
        start.timetag<-start
        end.timetag<-end
    }
    else
    {
        start.timetag<-as.POSIXct(start)
        end.timetag<-as.POSIXct(end)
    }
    
    
    retObj$span<-end.timetag-start.timetag
    retObj$printStr<-paste(round(retObj$span,digits=2),attr(retObj$span,'units'))
    retObj$second.2<-0
    
    return(retObj)
}



is.POSIXct<-function(timeObject)
{ 
    inherits(timeObject, "POSIXct")
}

library(compiler)
ElapsedTime<-cmpfun(interpretElapsedTime)

