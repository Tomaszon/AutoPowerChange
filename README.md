# AutoPowerChange

Automatically changes power plan
* Triggers Windows power plan change on 
  + User logon
  + Ac/Dc change
  + High power app launch/termination
* Compensates screen brightness change
* Shows toast notification on trigger
* Suggests resolution based on selected power plan
* Reregisters task on trigger to apply high power app list changes 
  + Can be configured in processes.json as "processNameRegex": "filePath" dictionary
  + Scheduled Task Trigger supports filters with only finite complexity
* Sets script execution policy after execution based on config

For app launch/terminate trigger the following key must be set: <br/>
Local Security Policy -> Local Policies -> Audit Policy -> Audit process tracking -> Success

All used Windows power plan must be created manually before execution

Initialize-APC must be executed manually at the first time to create the scheduled tasks