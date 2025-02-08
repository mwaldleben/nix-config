{ pkgs, ... }:
{
  home.packages = [ pkgs.todo-txt-cli ];

  xdg.configFile."todo/config".text = ''
    export TODO_DIR=/home/${config.home.username}/notes
    export TODO_FILE="$TODO_DIR/todo.txt"
    export DONE_FILE="$TODO_DIR/done.txt"
    export REPORT_FILE="$TODO_DIR/report.txt"

    export PRI_A=$YELLOW
    export PRI_B=$GREEN
    export PRI_C=$BLUE
    export COLOR_DONE=$LIGHT_GREY
    export COLOR_PROJECT=$RED
    export COLOR_CONTEXT=$CYAN
    export COLOR_DATE=$BLUE
    export COLOR_NUMBER=$LIGHT_GREY
    export COLOR_META=$LIGHT_GREY

    export TODOTXT_VERBOSE=0
  '';
}
