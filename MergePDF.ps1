# Define the current working directory
$cwd = Get-Location

# Get all PDF files in the directory
$pdfFiles = Get-ChildItem -File -Filter *.pdf

# Get the list of PDF files along with their sizes
$pdfDetails = foreach ($file in $pdfFiles) {
    [PSCustomObject]@{
        FileName  = $file.FullName
        FileSize  = $file.Length
    }
}

# Sort the PDF files by size (descending)
$sortedPDFs = $pdfDetails | Sort-Object -Property FileSize -Descending

# Show what files are merged and in what order (only filenames)
echo "The following files will be merged in this order:"
$sortedPDFs | ForEach-Object { echo ([System.IO.Path]::GetFileName($_.FileName)) }

# Generate the save location and new filename
$largestPDF = $sortedPDFs | Select-Object -First 1
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($largestPDF.FileName)
$revSuffix = "_rev$((Get-Date -Format 'yyyy'))a_Merged"
$savelocation = Join-Path $cwd ("$baseName$revSuffix.pdf")

# Perform the merge in the desired order
Merge-PDF -InputFile $sortedPDFs.FileName -OutputFile $savelocation

# Output the save location
echo "Merged PDF saved to: $savelocation"
