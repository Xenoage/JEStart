Attribute VB_Name = "mTools"
'This file is part of Xenoage Java Exe Starter.
'
'Xenoage Java Exe Starter is free software; you can redistribute it and/or modify
'it under the terms of the GNU General Public License as published by
'the Free Software Foundation; either version 2 of the License, or
'(at your option) any later version.
'
'Xenoage Java Exe Starter is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.
'
'You should have received a copy of the GNU General Public License
'along with Xenoage Java Exe Starter; if not, write to the Free Software
'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Option Explicit

Private Declare Function GetLocaleInfo Lib "kernel32" _
  Alias "GetLocaleInfoA" ( _
  ByVal Locale As Long, _
  ByVal LCType As Long, _
  ByVal lpLCData As String, _
  ByVal cchData As Long) As Long
  

Public Const LOCALE_SLANGUAGE = &H2
Public Const LOCALE_SENGLANGUAGE = &H1001

Private Declare Function ShellExecute Lib "Shell32.dll" Alias _
    "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation _
    As String, ByVal lpFile As String, ByVal lpParameters _
    As String, ByVal lpDirectory As String, ByVal nShowCmd _
    As Long) As Long

'INI Files:
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
    
'get relative path
Private Declare Function PathRelativePathTo Lib "shlwapi.dll" _
  Alias "PathRelativePathToA" ( _
  ByVal pszPath As String, _
  ByVal pszFrom As String, _
  ByVal dwAttrFrom As Long, _
  ByVal pszTo As String, _
  ByVal dwAttrTo As Long) As Long

Private Const MAX_PATH = 260
Private Const FILE_ATTRIBUTE_DIRECTORY = &H10
Private Const FILE_ATTRIBUTE_NORMAL = &H80



Public Function GetSystemLocaleInfo( _
  ByVal LocaleID As Long) As String
  
  Const SYSTEM_DEFAULT As Long = &H800
  
  Dim sBuffer As String
  Dim nResult As Long

  ' Rückgabestring füllen
  sBuffer = Space$(255)
  nResult = GetLocaleInfo(SYSTEM_DEFAULT, LocaleID, _
    sBuffer, Len(sBuffer))
  
  If nResult > 0 Then
    GetSystemLocaleInfo = Left$(sBuffer, nResult - 1)
  End If
End Function



Public Function SplitFileFromPath(ByVal Path As String) _
 As String

  Dim File As String
  
  File = ""
  While Right$(Path, 1) <> "\" And _
    Right$(Path, 1) <> "/" And _
    Right$(Path, 1) <> ":" And Path <> ""

    File = Right$(Path, 1) + File
    Path = Left$(Path, Len(Path) - 1)
  Wend
  
  SplitFileFromPath = File
End Function


Public Function SplitDirFromPath(ByVal Path As String) _
 As String

  Dim i As Integer
  i = InStrRev(Path, "\")
  If ((i = 0) Or (InStrRev(Path, "/") > i)) Then
    i = InStrRev(Path, "/")
  End If
  
  If (i > 0) Then
    SplitDirFromPath = Left(Path, i)
  Else
    SplitDirFromPath = ""
  End If
End Function


Public Function FillWithSpaces(Src As String, Length As Long) As String
  If (Len(Src) < Length) Then
    FillWithSpaces = Src & Space(Length - Len(Src))
  Else
    FillWithSpaces = Src
  End If
End Function


'URL extern öffnen
Public Sub OpenURL(hWnd As Long, URL As String)
  ShellExecute hWnd, "Open", URL, vbNullString, vbNullString, 1
End Sub

'Write into INI file
Public Function WriteINI(Dateiname As String, Sektion As String, Eintrag As String, Wert As String) As Long
  WriteINI = WritePrivateProfileString(Sektion, Eintrag, Wert, Dateiname)
End Function

'Read from INI file
Public Function InputINI(Dateiname As String, Sektion As String, Eintrag As String) As String
  Dim temp As String, x As Long
  temp = String(255, 0)
  x = GetPrivateProfileString(Sektion, Eintrag, "", temp, 255, Dateiname)
  temp = Left(temp, x)
  InputINI = temp
End Function

'Cut a string if it is too long
Public Function StringCut(s As String, MaxLen As Integer) As String
  If (Len(s) > MaxLen) Then
    StringCut = Left(s, MaxLen)
  Else
    StringCut = s
  End If
End Function

'find a string in a binary file
'returns 0 if not found, otherwise the index of the first char is returned
Public Function FindStringInFile(s As String, FilePath As String) As Long
  Dim FileNr As Integer
  Dim sFile As String
  FindStringInFile = 0
  If Dir(FilePath, vbNormal) <> "" Then
    FileNr = FreeFile()
    Open FilePath For Binary As #FileNr
    sFile = Space(LOF(FileNr))
    Get #FileNr, , sFile
    Close #FileNr
    FindStringInFile = InStr(1, sFile, s)
  End If
End Function


'get relative path
Public Function GetRelativePath(ByVal sFolder As String, _
  ByVal sDirOrPath As String, _
  Optional ByVal bIsFile As Boolean = True) As String

  Dim sPath As String

  sPath = Space$(MAX_PATH)
  If PathRelativePathTo(sPath, sFolder, FILE_ATTRIBUTE_DIRECTORY, _
    sDirOrPath, _
    IIf(bIsFile, FILE_ATTRIBUTE_NORMAL, FILE_ATTRIBUTE_DIRECTORY)) <> 0 Then
    
    sPath = Left$(sPath, InStr(sPath, Chr$(0)) - 1)
  Else
    sPath = ""
  End If

  GetRelativePath = sPath
End Function



