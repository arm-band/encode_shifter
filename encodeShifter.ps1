param(
    [String]$in = ( Convert-Path . ) + "\src",
    [String]$out = ( Convert-Path . ) + "\dist",
    [String]$from = "Shift-JIS"
)

$enc_f = [Text.Encoding]::GetEncoding($from)
$enc_t = $( New-Object System.Text.UTF8Encoding($False))
Get-ChildItem $in -recurse |
ForEach-Object {
    if($_.GetType().Name -eq "FileInfo"){
        if($_.Extension.ToLower() -in @(".html",".htm",".js",".css",".pl",".cgi",".php",".twig")){
            $reader = New-Object IO.StreamReader($_.FullName, $enc_f)
            $o_path = $_.FullName.ToLower().Replace($in.ToLower(), $out)
            $o_folder = Split-Path $o_path -parent
            if(!(Test-Path $o_folder)){
                [Void][IO.Directory]::CreateDirectory($o_folder)
            }
            $writer = New-Object IO.StreamWriter($o_path, $false, $enc_t)
            while(!$reader.EndOfStream){$writer.WriteLine($reader.ReadLine())}
            $reader.Close()
            $writer.Close()
        }
    }
}
