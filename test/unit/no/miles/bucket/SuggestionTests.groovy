package no.miles.bucket

import grails.test.*

class SuggestionTests extends GrailsUnitTestCase {

  User user

  protected void setUp() {
    super.setUp()
    user = new User(username: "Test");
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCountVotes() {
    def suggestion = new Suggestion()
    suggestion.addToVotes (new Vote(user: user, weight: 4))
    assertEquals (4, suggestion.voteCount())

  }
}
