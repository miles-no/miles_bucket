
<%@ page import="no.miles.bucket.Suggestion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Suggestion</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Suggestion List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Suggestion</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Suggestion</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${suggestionInstance}">
            <div class="errors">
                <g:renderErrors bean="${suggestionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${suggestionInstance?.id}" />
                <input type="hidden" name="version" value="${suggestionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="responsible">Responsible:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'responsible','errors')}">
                                    <g:select optionKey="id" from="${no.miles.bucket.User.list()}" name="responsible.id" value="${suggestionInstance?.responsible?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="targetDate">Target Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'targetDate','errors')}">
                                    <g:datePicker name="targetDate" value="${suggestionInstance?.targetDate}" precision="minute" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments">Comments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'comments','errors')}">
                                    <g:select name="comments"
from="${no.miles.bucket.Comment.list()}"
size="5" multiple="yes" optionKey="id"
value="${suggestionInstance?.comments}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createdBy">Created By:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'createdBy','errors')}">
                                    <g:select optionKey="id" from="${no.miles.bucket.User.list()}" name="createdBy.id" value="${suggestionInstance?.createdBy?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createdTime">Created Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'createdTime','errors')}">
                                    <g:datePicker name="createdTime" value="${suggestionInstance?.createdTime}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:suggestionInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status">Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'status','errors')}">
                                    <g:select  from="${no.miles.bucket.Status?.values()}" value="${suggestionInstance?.status}" name="status" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:suggestionInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="votes">Votes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suggestionInstance,field:'votes','errors')}">
                                    <g:select name="votes"
from="${no.miles.bucket.Vote.list()}"
size="5" multiple="yes" optionKey="id"
value="${suggestionInstance?.votes}" />

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
