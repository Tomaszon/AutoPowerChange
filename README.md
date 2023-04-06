# AutoPowerChange

Automatically changes power plan
* Changes Windows power plan that triggers on 
  + User logon
  + Ac/Dc change
  + High power app launch/termination
* Compensates screen brightness change
* Shows toast notification on trigger
* Reregisters task on trigger to apply high power app list changes
  + Can be configured in processes.json "processname": "filePath" dictionary
* Sets script execution policy after execution based on config

For app launch/terminate trigger the following key must be set:<br/>Local Security Policy -> Local Policies -> Audit Policy -> Audit process tracking -> Success
