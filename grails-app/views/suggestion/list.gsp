
<%@ page import="no.miles.bucket.Suggestion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Suggestion List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Suggestion</g:link></span>
        </div>
        <div class="body">
            <h1>Suggestion List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Responsible</th>
                   	    
                   	        <g:sortableColumn property="targetDate" title="Target Date" />
                        
                   	        <th>Comments</th>
                   	    
                   	        <th>Created By</th>
                   	    
                   	        <g:sortableColumn property="createdTime" title="Created Time" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${suggestionInstanceList}" status="i" var="suggestionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${suggestionInstance.id}">${fieldValue(bean:suggestionInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:suggestionInstance, field:'responsible')}</td>
                        
                            <td>${fieldValue(bean:suggestionInstance, field:'targetDate')}</td>
                        
                            <td>${fieldValue(bean:suggestionInstance, field:'comments')}</td>
                        
                            <td>${fieldValue(bean:suggestionInstance, field:'createdBy')}</td>
                        
                            <td>${fieldValue(bean:suggestionInstance, field:'createdTime')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${suggestionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
