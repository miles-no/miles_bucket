import java.text.SimpleDateFormat
import java.text.DateFormat

class DatePickerTagLib {

  def showDate = { date ->
    DateFormat dformat = SimpleDateFormat.getDateInstance(DateFormat.SHORT);
    out << "<input type=\"text\" value=\"" + dformat.format(date) + "\">"
  }

}
