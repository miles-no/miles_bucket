
<%@ page import="no.miles.bucket.Vote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Vote</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Vote List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Vote</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Vote</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${voteInstance}">
            <div class="errors">
                <g:renderErrors bean="${voteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${voteInstance?.id}" />
                <input type="hidden" name="version" value="${voteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:voteInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${no.miles.bucket.User.list()}" name="user.id" value="${voteInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weight">Weight:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:voteInstance,field:'weight','errors')}">
                                    <input type="text" id="weight" name="weight" value="${fieldValue(bean:voteInstance,field:'weight')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
