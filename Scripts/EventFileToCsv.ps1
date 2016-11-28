# cd /
$decades = Get-ChildItem -Directory 

foreach($decade in $decades)
{
    cd $decade
    $files = Get-ChildItem -File | Where-Object {$_.Extension -ilike ".EV*"}

    foreach($file in $files)
    {
       $filename = $file.BaseName.ToString()
       $year = $filename.Substring(0,4)

       $command = ".\BEVENT.EXE -y $year -f 0-96 $file > $filename.csv"
       Invoke-Expression $command 
    }
    cd ..
}