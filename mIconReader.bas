Attribute VB_Name = "mIconReader"
Option Explicit


Public Function ReadIconImageData(FilePath As String, Width As Byte, _
  Height As Byte, BitCount As Integer, retData As String) As Boolean
On Error GoTo ERR_OUT
  
  Dim FileNr As Integer
  FileNr = FreeFile()
  
  Dim ImagesCount As Integer
  Dim DataLen As Long
  Dim i As Long
  Dim offset As Long
  Dim bTemp As Byte
  Dim iTemp As Integer
  Dim lTemp As Long
  Dim bFound As Boolean
  
  Open FilePath For Binary As FileNr
  
    Get #FileNr, 5, ImagesCount
    offset = 7
    bFound = False
    
    For i = 0 To ImagesCount - 1
      Get #FileNr, offset, bTemp 'width
      If (bTemp = Width) Then
        Get #FileNr, offset + 1, bTemp 'height
        If (bTemp = Height) Then
          Get #FileNr, offset + 6, iTemp 'bit count
          If (iTemp = BitCount) Then
            bFound = True
            Get #FileNr, offset + 8, DataLen 'length of image data
            Get #FileNr, offset + 12, lTemp 'offset of image data
            retData = String(DataLen, " ")
            Get #FileNr, lTemp + 1, retData
            'MsgBox Asc(retData)
            'MsgBox Len(retData)
            Exit For
          End If
        End If
      End If
      offset = offset + 16
    Next
  
  Close FileNr

  ReadIconImageData = bFound
  Exit Function
ERR_OUT:
  ReadIconImageData = False
End Function
  

