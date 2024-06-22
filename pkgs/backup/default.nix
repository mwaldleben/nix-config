# script to backup home directory using rsync
{
  lib,
  writeShellApplication,
  rsync,
}:
(writeShellApplication {
  name = "backup";
  runtimeInputs = [ rsync ];

  text = ''
    sudo rsync -razv --info=backup --delete --exclude={'.local','.mozilla'} /persist/home/moritz/ /run/media/moritz/MORITZ_SSD/backup/
  '';
})
// {
  meta = with lib; {
    license = licenses.mit;
    platforms = platforms.all;
  };
}
