package no.miles.bucket

class Suggestion {

    String title;
    Date createdTime;
    User createdBy;
    Status status;
    Date targetDate;
    String description;
    User responsible;
    SortedSet comments;
    Set votes;

    static constraints = {
      responsible(nullable: true);
      targetDate(nullable: true);
    }

    static hasMany = [comments : Comment,
                      votes: Vote];

  def voteCount() {
    def count = 0
    votes.each {
      count += it.weight
    }
    count
  }

}
