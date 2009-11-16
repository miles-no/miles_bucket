package no.miles.bucket

import java.text.SimpleDateFormat
import no.miles.bucket.Comment
import no.miles.bucket.Suggestion
import no.miles.bucket.User

class SuggestionController {

  def scaffold = Suggestion


  def listByTargetDate = {
    if (params.targetDate) {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
      def targetDate = sdf.parse(params.targetDate);
      def suggestions = Suggestion.findAllByTargetDate(targetDate)
      render(view: 'list', model: ['suggestionInstanceList': suggestions,
              'suggestionInstanceTotal': Suggestion.count()])

    }
  }
  
}
