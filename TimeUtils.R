# Script for Time Utils
# SVN: $Id: TimeUtils.R 522 2012-02-27 19:38:38Z rob $


library(lubridate)

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
    retObj$printStr<-print(as.period(retObj$span))
    retObj$second.2<-round(as.period(retObj$span)$second,2)
    
    return(retObj)
}


library(compiler)
ElapsedTime<-cmpfun(interpretElapsedTime)

