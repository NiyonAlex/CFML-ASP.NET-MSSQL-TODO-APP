<cfcomponent>
    <cffunction name="getAll" access="public" returntype="array" output="false">
        <cfhttp url="http://localhost:5000/api/Tasks" method="get" result="response">
        <cfreturn DeserializeJSON(response.filecontent)>
    </cffunction>

    <cffunction name="getById" access="public" returntype="struct" output="false">
        <cfhttp url="http://localhost:5000/api/Tasks/#arguments.id#" method="get" result="response">
        <cfreturn DeserializeJSON(response.filecontent)>
    </cffunction>

    <cffunction name="add" access="public" returntype="void" output="false">
        <cfhttp url="http://localhost:5000/api/Tasks" method="post">
            <cfhttpparam type="body" value="#SerializeJSON(arguments)#">
        </cfhttp>
    </cffunction>

    <cffunction name="update" access="public" returntype="void" output="false">
        <cfhttp url="http://localhost:5000/api/Tasks/#arguments.taskId#" method="put">
            <cfhttpparam type="body" value="#SerializeJSON(arguments)#">
        </cfhttp>
    </cffunction>

    <cffunction name="delete" access="public" returntype="void" output="false">
        <cfhttp url="http://localhost:5000/api/Tasks/#arguments.id#" method="delete">
        </cfhttp>
    </cffunction>
</cfcomponent>
