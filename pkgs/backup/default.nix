# script to backup home directory using rsync
{
  writeShellApplication,
  rsync,
}:
writeShellApplication {
  name = "backup";
  runtimeInputs = [ rsync ];

  text = ''
    sudo rsync -razv --info=backup --delete --exclude={'.local','.mozilla','.config/mozilla'} /persist/home/moritz/ /run/media/moritz/MORITZ_SSD/backup/
  '';
}
