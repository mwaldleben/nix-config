{ pkgs, ... }:
{
  home.packages = with pkgs; [ khal ];
  xdg.configFile."khal/config".text = ''
    [calendars]

      [[personal]]
        path = ~/.calendars/personal/
        color = dark blue

      [[work]]
        path = ~/.calendars/work/
        color = yellow
        readonly = True

      [[holidays]]
        path = ~/.calendars/holidays/
        color = dark green 
        readonly = True

      [[birthdays]]
        path = ~/.contacts/
        color = dark cyan  
        type = birthdays

    [default]
      default_calendar = personal
      highlight_event_days = true
      timedelta = 31d

    [view]
      agenda_event_format = {calendar-color}{cancelled}{start-end-time-style} {title}{repeat-symbol}{reset}

    [locale]
      timeformat = %H:%M
      dateformat = %d.%m
      longdateformat = %d.%m.%Y
      datetimeformat = %d.%m.%Y %H:%M
      longdatetimeformat = %d.%m.%Y %H:%M
  '';
}
