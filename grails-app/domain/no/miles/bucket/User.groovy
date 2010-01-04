package no.miles.bucket

import no.miles.bucket.Role

/**
 * User domain class.
 */
class User {

  static transients = ['pass']
  static hasMany = [authorities: Role]
  static belongsTo = Role

  /** Username  */
  String username
  /** User Real Name */
  String userRealName
  /** MD5 Password  */
  String passwd
  /** enabled  */
  boolean enabled

  String email
  boolean emailShow

  /** description  */
  String description = ''

  /** plain password to create a MD5 password  */
  String pass = '[secret]'

  //TODO: Kan vi konfigurere default verdien?
  int availableVotes = 10;

  static constraints = {
    username(blank: false, unique: true)
    userRealName(blank: false)
    passwd(blank: false)
    enabled()
  }

  def vote(weight) {
    if (canVote(weight)) {
      availableVotes -= weight
      new Vote(user: this, weight: weight)
    }
  }

  def canVote(weight) {
    availableVotes >= weight
  }

  @Override
  public String toString() {
    return userRealName
  }
}
