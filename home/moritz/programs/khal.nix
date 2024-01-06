{ pkgs, ... }: {
  home.packages = with pkgs; [ khal ];
  xdg.configFile."khal/config".text = ''

    [calendars]

    [[calendar]]
    color = dark blue
    path = ~/calendar
    type = calendar 

    [default]
    default_calendar = calendar
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
