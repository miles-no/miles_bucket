
<%@ page import="no.miles.bucket.Vote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Vote List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Vote</g:link></span>
        </div>
        <div class="body">
            <h1>Vote List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>User</th>
                   	    
                   	        <g:sortableColumn property="weight" title="Weight" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${voteInstanceList}" status="i" var="voteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${voteInstance.id}">${fieldValue(bean:voteInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:voteInstance, field:'user')}</td>
                        
                            <td>${fieldValue(bean:voteInstance, field:'weight')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${voteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
