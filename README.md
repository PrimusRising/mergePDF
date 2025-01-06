# PDF Merge Script

This PowerShell script automates the process of merging all PDF files in the current working directory, sorting them by file size in descending order before merging. The resulting PDF is saved with a new filename that includes a revision suffix and the current year.

## Features
- Automatically finds all PDF files in the current directory.
- Sorts the files by size in descending order.
- Merges the files in the sorted order.
- Saves the merged file with a descriptive filename.

## Prerequisites
- PowerShell 5.1 or later.
- A PowerShell module that provides the `Merge-PDF` cmdlet (e.g., `PdfSharp.Powershell` or another library).

## Usage

1. Open a PowerShell terminal.
2. Navigate to the directory containing the PDF files you want to merge.
3. Run the script.

### Example

```powershell
# Navigate to the directory containing the PDF files
cd C:\path\to\pdfs

# Run the script
.\MergePDF.ps1
