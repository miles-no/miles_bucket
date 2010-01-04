<%@ page import="no.miles.bucket.Suggestion" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Suggestion List</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
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
        <g:sortableColumn property="title" title="Title"/>
        <th>Responsible</th>
        <g:sortableColumn property="targetDate" title="Target Date"/>
        <th>Created By</th>
        <g:sortableColumn property="createdTime" title="Created Time"/>
        <th>Vote count</th>
        <th>Vote!</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${suggestionInstanceList}" status="i" var="suggestionInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link action="show" id="${suggestionInstance.id}">${fieldValue(bean: suggestionInstance, field: 'title')}</g:link></td>
          <td>${fieldValue(bean: suggestionInstance, field: 'responsible')}</td>
          <td>
            <g:formatDate format="dd.MM.yy" value="${suggestionInstance.targetDate}"/>
          </td>
          <td>${fieldValue(bean: suggestionInstance, field: 'createdBy')}</td>
          <td>
            <g:formatDate format="dd.MM.yy" value="${suggestionInstance.createdTime}"/>
          </td>
          <td>${suggestionInstance.voteCount()}</td>
          <td><g:link action="vote" id="${suggestionInstance.id}">Vote!</g:link></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${suggestionInstanceTotal}"/>
  </div>
</div>
</body>
</html>
