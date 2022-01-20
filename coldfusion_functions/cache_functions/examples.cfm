<!--- cacheGet function , gets an object stored in the cache --->
<!---<cfscript>
    // creating a cache region struct with empty properties
    cPros = {};
    cacheRegionNew("aRegion",cPros,true);
    //create object myObj
    myObj = {};
    myObj.a = "hello";
    myObj.b = "world";
    // store myobj in the cache region
    cachePut("id_1",myObj,createTimespan(0,0,30,0),createTimespan(0,0,15,0),"aRegion");
    writeDump(cacheGet("id_1","aRegion"));
    
</cfscript>--->
<!--- cacheGetAllIds function , returns an array of ids in that particular region --->
<!--- CacheGetEngineProperties function , returns the current caching engine--->
<cfscript>
    writeDump(cacheGetAllIds("aRegion",true));
    WriteDump(CacheGetEngineProperties());
</cfscript>

<!--- cacheGetProperties function , gets the properties of cache struct object --->
<!---<cfscript>
    // create a cache region
    rProps={};
    CacheRegionNew("_Region",rProps,true);
    // set cache properties
    propStruct={};
    propStruct.diskStore="store 1";
    propStruct.diskPersistent=true;
    propStruct.eternal=true;
    propStruct.maxEntriesLocalHeap="20";
    CacheSetProperties(propStruct,"_Region");
    Writedump(CacheGetProperties("_Region"));
</cfscript>--->
<cfset cachePut("cache1","hello",15,15,"_Region")> 
 
<!--- get underlying user-defined object cache ---> 
<cfset objectCache = cachegetsession("object",true)> 
 
<!--- get/print user-defined object cache properties ---> 
<cfset config = objectCache.getCacheConfiguration()>
<cfdump var="#config#"/>

<br>
<cache 
name="customcache" 
maxElementsInMemory="1000" 
eternal="false" 
timeToIdleSeconds="720" 
timeToLiveSeconds="720" 
overflowToDisk="true" 
diskSpoolBufferSizeMB="10" 
maxElementsOnDisk="100000" 
diskPersistent="true" 
diskExpiryThreadIntervalSeconds="3600" 
memoryStoreEvictionPolicy="LRU"/>

<!--- put an object into user-defined object cache ---> 
<cfset cachePut("cache1","hello",15,15,"customCache")> 
 
<!--- get underlying user-defined object cache ---> 
<cfset objectCache = cachegetsession("customCache",true)> 
 
<!--- get/print user-defined object cache properties ---> 
<cfset config = objectCache.getCacheConfiguration()> 
<cfoutput> 
getMaxElementsInMemory() :: #config.getMaxElementsInMemory()#<br> 
isEternal() :: #config.isEternal()#<br> 
getTimeToIdleSeconds() :: #config.getTimeToIdleSeconds()#<br> 
getTimeToLiveSeconds() :: #config.getTimeToLiveSeconds()#<br> 
isOverflowToDisk() :: #config.isOverflowToDisk()#<br> 
getDiskSpoolBufferSizeMB() :: #config.getDiskSpoolBufferSizeMB()#<br> 
getMaxElementsOnDisk() :: #config.getMaxElementsOnDisk()#<br> 
isDiskPersistent() :: #config.isDiskPersistent()#<br> 
getDiskExpiryThreadIntervalSeconds() :: #config.getDiskExpiryThreadIntervalSeconds()#<br> 
getMemoryStoreEvictionPolicy() :: #config.getMemoryStoreEvictionPolicy()#<br> 
isClearOnFlush() :: #config.isClearOnFlush()#<br> 
</cfoutput>

<!--- cacheIdExists function , Checks if the cache object is present , returns boolean --->
<cfscript>
    //  Create a new object 
    obj1 = {};
    obj1.name = "hello world";
    // Define the time to live and time to idle parameters 
    timeToLive=createtimespan(0,0,0,30);
    timeToIdle=createtimespan(0,0,0,30);
    writeOutput("Starting to write to cache..");
    cachePut("id_obj1",obj1,timeToLive,timeToIdle,"customcache");
    writeOutput("Done!!");
    writeOutput("Trying to check if the cached item is present...");
    writeOutput(cacheIdExists("id_obj1","customcache"));
</cfscript>
<br>
<!--- cacheRegionNew function , creates a new cache region --->
<cfscript>
    defaultCacheProps = StructNew();
    defaultCacheProps.maxElementsInMemory = "5";
    defaultCacheProps.eternal = "false";
    defaultCacheProps.timeToIdleSeconds= "100";
    defaultCacheProps.timeToLiveSeconds= "50";
    defaultCacheProps.overflowToDisk= "true";
    defaultCacheProps.diskExpiryThreadIntervalSeconds= "3600";
    defaultCacheProps.diskPersistent= "false";
    defaultCacheProps.diskPoolBufferSizeMB= "30";
    defaultCacheProps.maxElementsOnDisk= "10";
    defaultCacheProps.memoryEvictionPolicy= "LRU";
    defaultCacheProps.clearOnFlush= "true";
    defaultCacheProps.objectType= "Object";
    // create cache region
    cacheRegionNew("testregion",defaultCacheProps,false)
    // Defining a struct object
    obj1 = StructNew() 
    obj1.name = "xyz" 
    timeToLive = CreateTimeSpan(0,0,5,0)
    timeToIdle = CreateTimeSpan(0,0,10,0)
    // Putting Cache in the USD specific cache
    writeOutput("Starting to write to cache..")
    cachePut("obj1",obj1,timetoLive,timeToIdle,"testregion")
    writeOutput("Trying to fetch cached item...") 
    obj = cacheGet("obj1","testregion")
    writeOutput(obj.name)
</cfscript>
<br>
<!--- CacheRegionRemove function , removes the specified cache region ---> 
<cfscript>
    //define a cache region struct
    rProps={};
    // define properties for region struct
    rProps.MAXELEMENTSINMEMORY = "5";
    rProps.ETERNAL = "false";
    rProps.TIMETOIDLESECONDS = "100";
    rProps.TIMETOLIVESECONDS = "50";
    rProps.OVERFLOWTODISK = "true";
    rProps.DISKEXPIRYTHREADINTERVALSECONDS = "3600";
    rProps.DISKPERSISTENT = "false";
    rProps.DISKSPOOLBUFFERSIZEMB = "30";
    rProps.MAXELEMENTSONDISK = "10";
    rProps.MEMORYEVICTIONPOLICY = "LRU";
    rProps.CLEARONFLUSH = "true";
    rProps.OBJECTTYPE = "OBJECT";
    // create a cache region, kRegion, that contains the properties defined above
    CacheRegionNew("kRegion",#rProps#,true);
    // display the properties of the newly created cache region
    WriteDump(CacheGetProperties("kRegion"));
    // remove the cache region
    WriteOutput("removing cache region....");
    CacheRegionRemove("kRegion");
    // try-catch to determine whether the cache region is removed
    try{
          writedump(CacheGetProperties("kRegion"));
    }
    catch(any e){
          WriteOutput("Error: " & e.message);
    }
</cfscript>
