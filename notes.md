# 2. Discovering Powershell 

## Running Commands 

**Command Structure** 

- Verb-Noun structure 
- DoSomething-ToSomething 

**Tab Completion**

`Get-Process` - get all the processes on the system 

`Get-<tab>` - list all Nouns 

`Get-Verb -<tab>` - list all parameters for `Get-Verb`

This also supports wildcards, such as `Get-Verb -Verb R*`

## Getting Help 

`Get-Help -Name <Verb-Noun>` to pull up the 'man' page 

## The Pipeline 

Store the return of `Get-Service` in the variable `service` 

`$service = Get-Service -DisplayName 'Windows Update'`

Pipe the variable (object) into `Get-Member` to view a list of its properties and methods. 

`$service | Get-Member` 

*NB: It seems `Get-Member` kind of functions as a more verbose `type()` variable (a la python) or a printed version of the `.` intellisense menu in Visual Studio.*

*In the example, Mr. Betram stored `Get-<Something>` into a variable and then piped it to `Get-Member`, but this does  not seem nessesary in so far as I've experimented. For example, the following seemed to work just fine: `Get-Date | Get-Member` in that it returned the associated properties/methods of `Get-Date`.*

Get only the properties of an object (*for lack of a better term*)

`Get-Date | Select-Object -Property`

# 3. Using Powershell 

## Finding and Using Modules 

**Modules and What They're Made Of**

- `Get-Content`
- `Get-Process`
- `Get-Service`
- `Get-Help`

[^1]

**Listing Modules** 

List all commands currently on the system (with module names on right-most column):

`Get-Command | less`

*NB: `more` & `less` work in PS*

List modules imported to the current session: 

`Get-Module`

To get all modules availible, run: 

`Get-Module -ListAvailible`

## Functions[^2]

**Understanding Functions**

'Commands' -eq 'Functions'

- accomplish one specific task 
- the building blocks of Powershell  

Get all the availible commands per session: 

`Get-Command | Group-Object -Property CommandType`

Note: the cmdlet is a compiled command--not a function. I guess functions refer to routines that are interpreted?

**Create a Function to Figure Out Whether or Not a Service is Started** 

	function Test-ServiceStarted {
		# Add parameters with parameter block 
		param(
			[Parameter()]
			[string]$name 
		)
		# Get-Service not recognized on Ubuntu VM
		# As such, I can't tell what kind of object Get-Service is
		# Lord, I hate non-statically typed langueges 
		
		if((Get-Service -Name 'wuauserv').Status -eq 'Running') {
			$true
		} else {
			$false
		}
	}

*NB: the Verb-Noun Convention in user-defined functions* 