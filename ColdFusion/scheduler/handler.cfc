<!---component implements="cfide.scheduler.ITaskEventHandler"
{
 public boolean function onTaskStart(Struct context){
  myvar="onTaskStart";
  cffile (action="append", file="#Expandpath('./')#log.txt", output="fireInstancedId:#context.fireinstanceID#, myvar: #myvar#<br>");
  return true;
  }
 public void  function Execute(Struct context){
  myvar= myvar & "Execute";
  cffile (action="append", file="#Expandpath('./')#log.txt", output="fireInstancedId:#context.fireinstanceID#, myvar: #myvar#<br>");
  }
 public void function onTaskEnd(Struct context){
  myvar=myvar & "onMisfire";
  cffile (action="append", file="#Expandpath('./')#log.txt", output="fireInstancedId:#context.fireinstanceID#, myvar: #myvar#<br>");
 }
 public void function onMisfire(Struct context){
  //FireInstance-Id would not be passed to onMisfire
 }
 public void function onError( Struct context){
  myvar= myvar & "onError";
  cffile (action="append", file="#Expandpath('./')#log.txt", output="fireInstancedId:#context.fireinstanceID#,myvar: #myvar#<br>");
       
 }
}--->
<cfcomponent implements="CFIDE.scheduler.ITaskEventHandler"> 
    <cffunction name="onTaskStart" returntype="boolean"> 
        <cfargument name="context" type="struct"/> 
        <cfmail from="aman2441999@gmail.com" subject="Scheduler_Scenario_Testing" to="aman2441999@gmail.com"> 
            The Report is about to be generated. 
        </cfmail> 
    <cfreturn true> 
    </cffunction> 
    <cffunction name="onMisfire" returntype="void"> 
        <cfargument name="context" type="struct" required="false"/> 
        <cfmail from="aman2441999@gmail.com" subject="Scheduler_Scenario_Testing" to="aman2441999@gmail.com"> 
            The Report generation task has misfired. 
        </cfmail> 
    </cffunction> 
    <cffunction name="onTaskEnd" access="public" returntype="void"> 
        <cfargument name="context" type="struct" required="false"/> 
        <cfmail from="aman2441999@gmail.com" subject="Scheduler_Scenario_Testing" to="aman2441999@gmail.com"> 
            The Report generation task has Completed. 
        </cfmail> 
    </cffunction> 
    <cffunction name="onError" returntype="void"> 
        <cfargument name="context" type="struct" required="false"/> 
        <cfmail from="aman2441999@gmail.com" subject="Scheduler_Scenario_Testing" to="aman2441999@gmail.com"> 
            The Report generation task has errored out. 
        </cfmail> 
    </cffunction> 
    <cffunction name="execute" returntype="void"> 
        <cfargument name="context" type="struct" required="false"/> 
        <cffile action="append" file="#Expandpath('.')#/log.txt" output="<b>In Execute</b>"> 
    </cffunction> 
</cfcomponent>