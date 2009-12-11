package no.miles.bucket

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_VOTER'])
class SuggestionController {

  def userService

  def index = { redirect(action: list, params: params) }

  // the delete, save and update actions only accept POST requests
  static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

  def list = {
    params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
    [suggestionInstanceList: Suggestion.list(params), suggestionInstanceTotal: Suggestion.count()]
  }

  def show = {
    def suggestionInstance = Suggestion.get(params.id)

    if (!suggestionInstance) {
      flash.message = "Suggestion not found with id ${params.id}"
      redirect(action: list)
    }
    else { return [suggestionInstance: suggestionInstance] }
  }

  def delete = {
    def suggestionInstance = Suggestion.get(params.id)
    if (suggestionInstance) {
      try {
        suggestionInstance.delete(flush: true)
        flash.message = "Suggestion ${params.id} deleted"
        redirect(action: list)
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "Suggestion ${params.id} could not be deleted"
        redirect(action: show, id: params.id)
      }
    }
    else {
      flash.message = "Suggestion not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def edit = {
    def suggestionInstance = Suggestion.get(params.id)

    if (!suggestionInstance) {
      flash.message = "Suggestion not found with id ${params.id}"
      redirect(action: list)
    }
    else {
      return [suggestionInstance: suggestionInstance]
    }
  }

  def update = {
    def suggestionInstance = Suggestion.get(params.id)
    if (suggestionInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (suggestionInstance.version > version) {

          suggestionInstance.errors.rejectValue("version", "suggestion.optimistic.locking.failure", "Another user has updated this Suggestion while you were editing.")
          render(view: 'edit', model: [suggestionInstance: suggestionInstance])
          return
        }
      }
      suggestionInstance.properties = params
      if (!suggestionInstance.hasErrors() && suggestionInstance.save()) {
        flash.message = "Suggestion ${params.id} updated"
        redirect(action: show, id: suggestionInstance.id)
      }
      else {
        render(view: 'edit', model: [suggestionInstance: suggestionInstance])
      }
    }
    else {
      flash.message = "Suggestion not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def create = {
    def suggestionInstance = new Suggestion()
    suggestionInstance.properties = params
    return ['suggestionInstance': suggestionInstance]
  }

  def save = {
    def suggestionInstance = new Suggestion(params)
    suggestionInstance.createdTime = new Date()
    suggestionInstance.status = Status.CREATE
    suggestionInstance.createdBy = userService.getCurrentUser()
    if (!suggestionInstance.hasErrors() && suggestionInstance.save()) {
      flash.message = "Suggestion ${suggestionInstance.id} created"
      redirect(action: show, id: suggestionInstance.id)
    }
    else {
      render(view: 'create', model: [suggestionInstance: suggestionInstance])
    }
  }
}
