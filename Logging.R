# Script for Logging support
# SVN: $Id: Logging.R 474 2012-01-04 22:19:19Z rob $

log.filename<-'./R-Logging.log'

log.level<-9

interpretLogWrite<-function(msg,msg.log.level=9)
{
    log.level.str<-paste(sep='','[',msg.log.level,']')
    if(msg.log.level<=log.level)
    {
        cat(file=log.filename, append=T, format(Sys.time(), "%Y-%m-%d %H:%M:%OS3"), '>>>', log.level.str, msg, '\n')  
    }
}


library(compiler)
LogWrite<-cmpfun(interpretLogWrite)

