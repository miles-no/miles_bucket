<%@ page import="no.miles.bucket.Suggestion" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Create Suggestion</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Suggestion List</g:link></span>
</div>
<div class="body">
  <h1>Create Suggestion</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${suggestionInstance}">
    <div class="errors">
      <g:renderErrors bean="${suggestionInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="title">Title:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: suggestionInstance, field: 'title', 'errors')}">
            <input type="text" id="title" name="title" value="${fieldValue(bean: suggestionInstance, field: 'title')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="description">Description:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: suggestionInstance, field: 'description', 'errors')}">
            <textarea type="text" id="description" name="description">
              ${suggestionInstance.description}
            </textarea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="responsible">Responsible:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: suggestionInstance, field: 'responsible', 'errors')}">
            <g:select optionKey="id" from="${no.miles.bucket.User.list()}" name="responsible.id" value="${suggestionInstance?.responsible?.id}" noSelection="['null':'']"></g:select>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="targetDate">Target Date:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: suggestionInstance, field: 'targetDate', 'errors')}">
            <g:datePicker name="targetDate" value="${suggestionInstance?.targetDate}" precision="day" noSelection="['':'']"></g:datePicker>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><input class="save" type="submit" value="Create"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
