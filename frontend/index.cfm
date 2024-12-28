<cfparam name="url.action" default="tasks.list">
<cfset actionParts = ListToArray(url.action, ".")>

<cfinclude template="controllers/#actionParts[1]#.cfc">

<cfset controller = CreateObject("component", "controllers.#actionParts[1]#")>
<cfset viewData = controller[actionParts[2]]()>

<cfinclude template="views/layout.cfm">
